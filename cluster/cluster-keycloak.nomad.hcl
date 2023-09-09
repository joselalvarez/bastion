variable "bastion_client_secret" {
    type = string
}

job "cluster-keycloak" {

    datacenters = ["dc1"]


    group "keycloak" {
        network {
            mode = "bridge"
            port "http" {
                to = 8080
            }
        }

        service {
            name = "keycloak"
            port = 8080
            connect {
                sidecar_service {
                    proxy {
                        upstreams {
                            destination_name = "kafka"
                            local_bind_port  = 9092
                        }
                    }
                }
                sidecar_task {
                    resources {
                        cpu    = 50
                        memory = 128
                    }
                }
            }
        }

        task "app" {
            driver = "docker"

            env {
                BASTION_CLIENT_SECRET = var.bastion_client_secret
                KEYCLOAK_ADMIN = "admin"
                KEYCLOAK_ADMIN_PASSWORD = "admin"
            }

            template {
                data = file("kc-realm-bastion.json.tpl")
                destination = "kc-realm-bastion.json"
            }

            template {
                data = file("kc-kafka-connector-config.properties.tpl")
                destination = "kc-kafka-connector-config.properties"
            }

            config {
                image = "docker.io/bastion/keycloak:22.0.1-jl"
                ports = ["http"]
                args  = ["start-dev --import-realm"]
                volumes = [
                    "kc-realm-bastion.json:/opt/keycloak/data/import/kc-realm-bastion.json",
                    "kc-kafka-connector-config.properties:/opt/keycloak/conf/kafka-connector-config.properties"
                ]
            }

            resources {
                cpu    = 500
                memory = 1024
            }
        }
    }
}