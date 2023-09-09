CACHE_IP = {{ env "NOMAD_UPSTREAM_IP_cache"}}
CACHE_PORT = {{ env "NOMAD_UPSTREAM_PORT_cache"}}
CACHE_USERNAME = admin
CACHE_PASSWORD = admin
CACHE_NAME = userinfo
CACHE_FILE_CONFIG = /opt/config/infinispan.xml
KAFKA_BOOTSTRAP_SERVERS = {{ env "NOMAD_UPSTREAM_ADDR_kafka"}}
USER_UPDATE_TOPIC = kc-user-update