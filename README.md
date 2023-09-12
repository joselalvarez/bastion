# Bastión de identificadores de usuario

Este proyecto es un ejemplo de cómo se puede usar el endpoint *userinfo* del estándar *OpenID Connect* en conjunción con una caché distribuida para custodiar (de manera eficiente) dentro del cluster los identificadores sensibles del usuario (identificadores clínicos, bancarios, etc.).

El diagrama del cluster es el siguiente:

![Cluster](https://github.com/joselalvarez/bastion/blob/main/_imgs/cluster.png?raw=true)

El cluster está compuesto por los siguientes componentes:
1. Un *reverse proxy* Nginx, cuya misión principal es hacer de puerta de entrada al cluster bloqueando las peticiones al endpoint *userinfo* provenientes del exterior.
2. Un proveedor de autenticación *Keycloak*, se encarga de gestionar los usuarios, de generar los tokens de acceso y de publicar todos los endpoints propios del estándar *OpenID Connect* (entre ellos el *userinfo*). En este caso, también tiene una extensión que envía un mensaje a Kafka cada vez que un usuario es modificado.
3. El microservicio *clinical-info-service*, contiene la lógica de nuestra aplicación, necesita conocer un identificador de usuario para acceder a informes clínicos de una aplicación de terceros (en este ejemplo, el CIP del paciente). En primer lugar, valida el token usando el endpoint de certificados del *Keycloak*, despues extrae el *subject* del token y comprueba si existe en la caché. En el caso de que no exista, invoca el endpoint *userinfo* con el token de acceso, el resultado se indexa en la caché distribuida de forma que ese valor estará disponible para posteriores peticiones.
4. Una caché distribuida *Infinispan* con los resultados obtenidos en las peticiones al endpoint *userinfo* indexados por el *subject* del token de acceso.
5. Un distribuidor de mensajes Kafka *Redpanda* con un *topic* en el que se encolan las sucesivas modificaciones que se producen en los usuarios del *Keycloak*.
6. Por último, otro microservicio llamado *cache-invalidate-service* que consume los mensajes del topic de modificación de usuarios y a partir del subject informado en el mensaje, invalida esa clave de la caché, de forma que en la siguiente petición se requerirá una nueva invocación al endpoint *userinfo* en la que se recuperará la última versión de la información del usuario.

## Herramientas y componentes
La distribución de Linux y las versiones de los componentes son solo a modo de orientación:
- [Rocky Linux 9.2](https://rockylinux.org) (distribución RHEL 9 compatible)
- [Docker](https://docs.docker.com/get-docker) 24.0.6
- [HashiCorp Nomad](https://www.nomadproject.io) 1.6.1
- [HashiCorp Consul](https://www.consul.io) 1.16.1
- [HashiCorp Terraform](https://www.terraform.io) 1.5.6
- [Infinispan](https://infinispan.org/) 14.0
- [Nginx](https://www.nginx.com/) 3.18
- [Keycloak](https://www.keycloak.org/) 22.0.1
- [Redpanda](https://redpanda.com/) 23.2.8
- [Maven](https://maven.apache.org) 3.9.4
- [Openjdk](https://openjdk.org/) 17.0.2
- [Micronaut](https://micronaut.io) 4.1.0
- [Sdkman](https://sdkman.io) 5.12.2

### Instalación de Docker, Nomad, Consul y Terraform
En el siguiente [enlace](https://github.com/joselalvarez/nomad-sample-cluster) se puede encontrar la información necesaria para realizar la instalación y ejecución de un cluster Nomad.

### Instalación de sdkman
Ejecutar el siguiente comando y seguir las instrucciones (Opciones por defecto).
```
$ curl -s https://get.sdkman.io | bash
```

Tras finalizar la instalación hay que abrir una nueva terminal de la consola o forzar la recarga de las variables de entorno. Para verificar la instalación:
```
$ sdk v
```

### Instalación de la OpenJDK 17
Instalar la OpenJDK 17 con *sdkman*:
```
$ sdk install java 17.0.2-open
```

### Instalación de Maven
```
$ sdk install maven
```

### Instalación de Micronaut
```
$ sdk install micronaut
```

### Construcción e instalación de las imágenes docker de los microservicios y el Keycloak con el conector Kafka
La construcción de las imágenes de los servicios Micronaut se realiza mediante Maven con la opción de empaquetado "docker":
```
$ cd clinical-info-service 
$ mvn package -Dpackaging=docker -Djib.to.image=bastion/clinical-info-service -Djib.to.tags=0.1
....

$ cd ../cache-invalidate-service
$ mvn package -Dpackaging=docker -Djib.to.image=bastion/cache-invalidate-service -Djib.to.tags=0.1
....
```

En cuanto al conector Kafka del *Keycloak*:
```
$ cd ../keycloak-kafka-connector
$ mvn clean install && docker build -t bastion/keycloak:22.0.1-jl .
....


```
Tras finalizar el proceso las imágenes deberán aparecer instaladas en nuestro repositorio local, listas para ser usadas por *Nomad*.

## Despliegue y ejecución del cluster
Para desplegar el cluster ir a la carpeta de los descriptores e iniciar y ejecutar *Terraform*:
```
$ cd cluster
$ terraform init
$ terraform apply
```

Una vez deplegado el cluster, podemos ir a la consolas de Nomad y Consul para ver que todo esta correctamente desplegado:

![Cluster](https://github.com/joselalvarez/bastion/blob/main/_imgs/cluster-1.png?raw=true)
![Cluster](https://github.com/joselalvarez/bastion/blob/main/_imgs/cluster-2.png?raw=true)

### Obtener token de acceso e invocación del servicio *clinical-info-service*

Durante el despliegue del *Keycloak* se importa automáticamente un *realm* llamado "bastion", dentro de cual ya vienen preconfigurados un par de usuarios llamados "user1" y "user2" (con los passwords "user1" y "user2" respectivamente), estos usuarios también tienen definidos los atributos "cip" y "tlf". Existe también un cliente llamado "bastion-cli" con los respectivos mapeos de los atributos de usuario indicados anteriormente al endpoint *userinfo* (**Los mapeos al ID token y al access token están deshabilitados para que el acceso a esos datos solo se pueda realizar mediante la invocación al endpoint**):

![Cluster](https://github.com/joselalvarez/bastion/blob/main/_imgs/cluster-3.png?raw=true)

En la url *http://127.0.0.1:9080/realms/bastion/protocol/openid-connect/auth?response_type=code&client_id=bastion-cli&scope=openid&redirect_uri=http://127.0.0.1/none* podemos acceder al formulario de login del *realm*, la url de redirección en este caso no es relevante ya que no la vamos a utilizar, simplemente queremos obtener el código de autorización, lo único a tener en cuenta es que esa url deberá coincidir con la que indiquemos cuando solicitemos el token de acceso. Por otro lado también es necesario realizar el login solicitando el *scope* "openid" para que el token de acceso obtenido sea válido para invocar el endpoint *userinfo*. Tras el login el código de autorización estará en la url de redirección del navegador:

```
http://127.0.0.1/none?session_state=68d6c97d-2018-4b63-a697-56a71c2a4fc7&code=d3f0ce1f-7aa5-42a2-8981-58b7ae19f76e.68d6c97d-2018-4b63-a697-56a71c2a4fc7.42ba3ef6-3241-4f1d-9257-87be369ac9d1
```

Este código lo podremos intercambiar por el token de acceso:

```
curl --location 'http://127.0.0.1:9080/realms/bastion/protocol/openid-connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'code=d3f0ce1f-7aa5-42a2-8981-58b7ae19f76e.68d6c97d-2018-4b63-a697-56a71c2a4fc7.42ba3ef6-3241-4f1d-9257-87be369ac9d1' \
--data-urlencode 'client_id=bastion-cli' \
--data-urlencode 'client_secret=bx0zeB9e2g6T5ZM2Q1GHpYlIf2CGdNQZ' \
--data-urlencode 'grant_type=authorization_code' \
--data-urlencode 'redirect_uri=http://127.0.0.1/none'
```
Token de acceso decodificado obtendido:

```
{
  "exp": 1694281909,
  "iat": 1694281609,
  "auth_time": 1694281573,
  "jti": "bb7574d6-5d6e-4f06-911a-62ac49193461",
  "iss": "http://127.0.0.1:9080/realms/bastion",
  "sub": "dbfcd8d1-f119-4c89-9409-544382abb11b",
  "typ": "Bearer",
  "azp": "bastion-cli",
  "session_state": "68d6c97d-2018-4b63-a697-56a71c2a4fc7",
  "scope": "openid",
  "sid": "68d6c97d-2018-4b63-a697-56a71c2a4fc7"
}
```

El único identificador del usuario presente en el token de acceso y en el ID token será el *subject* (sub).

Finalmente podremos invocar el servicio con este token de acceso:

```
curl --location 'http://127.0.0.1:9080/api/clinical-record' \
--header 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJudnlDZUZrZmpvTWdkMmZ0LVN1WTlHZkVTN1NjN2daZXI2eDBnU1lCam5vIn0.eyJleHAiOjE2OTQyODI5MDAsImlhdCI6MTY5NDI4MjYwMCwiYXV0aF90aW1lIjoxNjk0MjgxNTczLCJqdGkiOiIxMmQxMzNiMy1iY2ZmLTRiM2YtOGZkMC1iOGEzODYwZWUyMTUiLCJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjkwODAvcmVhbG1zL2Jhc3Rpb24iLCJzdWIiOiJkYmZjZDhkMS1mMTE5LTRjODktOTQwOS01NDQzODJhYmIxMWIiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJiYXN0aW9uLWNsaSIsInNlc3Npb25fc3RhdGUiOiI2OGQ2Yzk3ZC0yMDE4LTRiNjMtYTY5Ny01NmE3MWMyYTRmYzciLCJzY29wZSI6Im9wZW5pZCIsInNpZCI6IjY4ZDZjOTdkLTIwMTgtNGI2My1hNjk3LTU2YTcxYzJhNGZjNyJ9.AbjaziuvlQHDGwyFS8Yb-Ix_xLkywp6hoz1zF5voaUqsgbpdUn0MEpP5EtAUlN53LzOyx0jAdz8OBRgiHskoMii7sbEAiCOeI20uWVGRFarZyQ5khPSvVdU27ahA2wGuf7WfrCJQKaHeoSn1wXPbmAEIgIhHHQPK4pAoc95wq659H2U-BG3WPJctpTCizWuuiUvtUXU_gkeHHq9HhLawKYJGz0PiVjE7irdsYfibgH0MbwVpjI3FakvQ1nW6t5Zax9Ts9D-lwYxHbX5mB09UtQrjMPBZjbGPfTw9EUn7FjEkPiHqodW6_FYrG_U199SZD9PePW0HfzcbEIHJhLWksw'
```

En la respuesta podemos ver los atributos que tiene actualmente configurado el usuario:

```
{
    "patientCip": "AAAA1111111111",
    "document": "Clinical document for user1, tlf: 600000001"
}
```

Si accedemos a la consola de la caché *Infinispan* (*http://127.0.0.1:11222/console/cache/userinfo* usr:admin, pass:admin) podemos ver la nueva clave almacenada (codificada en Base64):

![Cluster](https://github.com/joselalvarez/bastion/blob/main/_imgs/cluster-4.png?raw=true)

Si comprobamos los logs del servicio también podemos ver que solo se invoca al endpoint *userinfo* la primera vez:

```
18:03:31.794 [io-executor-thread-1] INFO  o.j.b.p.service.UserInfoService - Getting UserInfo for subject: 'dbfcd8d1-f119-4c89-9409-544382abb11b' <<< Invocación al endpoint userinfo
18:03:32.249 [io-executor-thread-1] INFO  o.j.b.p.s.ClinicalRecordService - Getting ClinicalRecord for user cip: 'AAAA1111111111'
18:03:32.250 [io-executor-thread-1] INFO  o.j.b.p.c.ClinicalRecordController - Clinical Record found: 'Clinical document for user1, tlf: 600000001'
18:11:45.215 [io-executor-thread-3] INFO  o.j.b.p.c.ClinicalRecordController - Getting Clinical Record for Authorization
18:11:45.243 [io-executor-thread-3] INFO  o.j.b.p.s.ClinicalRecordService - Getting ClinicalRecord for user cip: 'AAAA1111111111'
18:11:45.244 [io-executor-thread-3] INFO  o.j.b.p.c.ClinicalRecordController - Clinical Record found: 'Clinical document for user1, tlf: 600000001'
18:11:47.383 [io-executor-thread-3] INFO  o.j.b.p.c.ClinicalRecordController - Getting Clinical Record for Authorization
18:11:47.388 [io-executor-thread-3] INFO  o.j.b.p.s.ClinicalRecordService - Getting ClinicalRecord for user cip: 'AAAA1111111111'
18:11:47.388 [io-executor-thread-3] INFO  o.j.b.p.c.ClinicalRecordController - Clinical Record found: 'Clinical document for user1, tlf: 600000001'
```

Por último también podemos verificar que la invocación desde fuera del cluster del endpoint *userinfo* no está permitida:

```
curl --location --request GET 'http://127.0.0.1:9080/realms/bastion/protocol/openid-connect/userinfo' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--header 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJudnlDZUZrZmpvTWdkMmZ0LVN1WTlHZkVTN1NjN2daZXI2eDBnU1lCam5vIn0.eyJleHAiOjE2OTQyODI5MDAsImlhdCI6MTY5NDI4MjYwMCwiYXV0aF90aW1lIjoxNjk0MjgxNTczLCJqdGkiOiIxMmQxMzNiMy1iY2ZmLTRiM2YtOGZkMC1iOGEzODYwZWUyMTUiLCJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjkwODAvcmVhbG1zL2Jhc3Rpb24iLCJzdWIiOiJkYmZjZDhkMS1mMTE5LTRjODktOTQwOS01NDQzODJhYmIxMWIiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJiYXN0aW9uLWNsaSIsInNlc3Npb25fc3RhdGUiOiI2OGQ2Yzk3ZC0yMDE4LTRiNjMtYTY5Ny01NmE3MWMyYTRmYzciLCJzY29wZSI6Im9wZW5pZCIsInNpZCI6IjY4ZDZjOTdkLTIwMTgtNGI2My1hNjk3LTU2YTcxYzJhNGZjNyJ9.AbjaziuvlQHDGwyFS8Yb-Ix_xLkywp6hoz1zF5voaUqsgbpdUn0MEpP5EtAUlN53LzOyx0jAdz8OBRgiHskoMii7sbEAiCOeI20uWVGRFarZyQ5khPSvVdU27ahA2wGuf7WfrCJQKaHeoSn1wXPbmAEIgIhHHQPK4pAoc95wq659H2U-BG3WPJctpTCizWuuiUvtUXU_gkeHHq9HhLawKYJGz0PiVjE7irdsYfibgH0MbwVpjI3FakvQ1nW6t5Zax9Ts9D-lwYxHbX5mB09UtQrjMPBZjbGPfTw9EUn7FjEkPiHqodW6_FYrG_U199SZD9PePW0HfzcbEIHJhLWksw' \
--data-urlencode 'code=8eda6136-1a2c-49c3-84f9-1f1d6c273b2c.a7f70aea-425b-431f-af29-7e248c18bb96.074e18f7-c84e-45eb-8a4d-252be4beeef9' \
--data-urlencode 'client_id=bastion-client' \
--data-urlencode 'client_secret=bx0zeB9e2g6T5ZM2Q1GHpYlIf2CGdNQZ' \
--data-urlencode 'grant_type=authorization_code' \
--data-urlencode 'redirect_uri=http://localhost/none'
```
```
<html>

<head>
	<title>403 Forbidden</title>
</head>

<body>
	<center>
		<h1>403 Forbidden</h1>
	</center>
	<hr>
	<center>nginx/1.25.2</center>
</body>

</html>
```

### Actualización de usuarios e invalidación de la caché

Como hemos visto anteriormente, en la caché tenemos almacenados datos indexados por "subject" obtenidos de la invocación al endpoint *userinfo*. En la imagen del Keycloak que hemos construido, se incluye una extensión con una implementación de un *listener* de tipo *org.keycloak.events.EventListenerProvider* que intercepta las modificaciones de usuarios y envía un mensaje informando de estas a un *topic* de Kafka. Estos mensajes serán consumido por el servicio *cache-invalidate-service*. El plugin se configura automáticamente durante la importación del *realm*:

![Cluster](https://github.com/joselalvarez/bastion/blob/main/_imgs/cluster-8.png?raw=true)

En este caso vamos a modificar el télefono del usuario en el *Keycloak* (http://127.0.0.1:9080/admin, user:admin, pass:admin) y comprobar como se borra la caché. :

![Cluster](https://github.com/joselalvarez/bastion/blob/main/_imgs/cluster-5.png?raw=true)

Si revisamos los logs del servicio *cache-invalidate-service* veremos que se ha invalidado el *subject*:

```
18:43:29.543 [io-executor-thread-2] INFO  org.infinispan.HOTROD - ISPN004006: Server sent new topology view (id=-863586430, age=0) containing 1 addresses: [127.0.0.1/<unresolved>:11222]
18:43:29.560 [pool-1-thread-1] INFO  o.j.b.c.config.RemoteCacheFactory - Remote Cache has been configured!!
18:43:29.658 [pool-1-thread-1] INFO  o.j.b.c.service.UserInfoCacheService - Invalidate cache key: 'dbfcd8d1-f119-4c89-9409-544382abb11b'
```

Y si accedemos a la consola de la caché veremos que ha sido borrada la entrada:

![Cluster](https://github.com/joselalvarez/bastion/blob/main/_imgs/cluster-6.png?raw=true)

Si volvemos a invocar el servicio *clinical-info-service*, veremos que la caché se vuelve a renovar invocando al *userinfo* con la información del usuario actualizada:

```
curl --location 'http://127.0.0.1:9080/api/clinical-record' \
--header 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJudnlDZUZrZmpvTWdkMmZ0LVN1WTlHZkVTN1NjN2daZXI2eDBnU1lCam5vIn0.eyJleHAiOjE2OTQyODU5NTksImlhdCI6MTY5NDI4NTY1OSwiYXV0aF90aW1lIjoxNjk0Mjg1NjQ5LCJqdGkiOiJiZDI3YzIwMC0wNTY0LTQ1MDAtYWFjMi0yMTRkYmU1ZTA5ODkiLCJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjkwODAvcmVhbG1zL2Jhc3Rpb24iLCJzdWIiOiJkYmZjZDhkMS1mMTE5LTRjODktOTQwOS01NDQzODJhYmIxMWIiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJiYXN0aW9uLWNsaSIsInNlc3Npb25fc3RhdGUiOiIxZDYzZTVkMC0yOGIxLTQzMjEtYjg2Zi00MTFmM2UzN2YwOGUiLCJzY29wZSI6Im9wZW5pZCIsInNpZCI6IjFkNjNlNWQwLTI4YjEtNDMyMS1iODZmLTQxMWYzZTM3ZjA4ZSJ9.eFmk7pjnmBK7cGvNo_FvGvOlKUqkh1nlOKljfYfvLKG4x5tqrDHCFGTjUiFqUFD-2V07vmdwXdmk48P2-6ZbmUYuQrsoZeduWuRwdZB51k3Mvv0M9MF_jt88oLoTdcDrOuf3d6mJLvVBAOn0rNvkZnX7Ml0bRctNEhY7pr4rFgtE12jyA5lUFdtMaZWveZpeC0QKezZbfM_U5UhgYHBZBi1T5ZU3fWnb0LSbPtWGwRhtdGiQTunrnDY6JZkcPc1qRRYpnO_RtV4cKl2e5uJjb2wGy94sASAhlRlGW584ddDJAU9IfkX_ts7eADLiGTQ9PZo1Sf4YjXMchC_nXM9UQw'
```
```
{
    "patientCip": "AAAA1111111111",
    "document": "Clinical document for user1, tlf: 600000005"
}
```
Y la caché vuelve a tener la información indexada con el teléfono cambiado:

![Cluster](https://github.com/joselalvarez/bastion/blob/main/_imgs/cluster-7.png?raw=true)

```
key -> dbfcd8d1-f119-4c89-9409-544382abb11b
value -> userinfo::{"sub":"dbfcd8d1-f119-4c89-9409-544382abb11b","cip":"AAAA1111111111","tlf":"600000005"}
```

## Detención del cluster

Para detener y borrar el cluster ejecutaremos en la consola:

```
$ terraform destroy
$ nomad system gc
```


