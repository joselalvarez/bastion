bootstrap.servers={{ env "NOMAD_UPSTREAM_ADDR_kafka"}}
key.serializer=org.apache.kafka.common.serialization.StringSerializer
value.serializer=org.apache.kafka.common.serialization.StringSerializer
kc_topic.name=kc-user-update