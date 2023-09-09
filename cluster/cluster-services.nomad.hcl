
job "cluster-services" {

    datacenters = ["dc1"]

    group "clinical-info-service" {
        network {
            mode = "bridge"
            port "http" {
                to = 9001
            }
        }

        service {
            name = "clinical-info-service"
            port = 9001
            connect {
                sidecar_service {
                    proxy {
                        upstreams {
                            destination_name = "cache"
                            local_bind_port  = 11222
                        }
                        upstreams {
                            destination_name = "keycloak"
                            local_bind_port  = 9080
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

            template {
                data = file("clinical-info-service.env.tpl")
                destination = "clinical-info-service.env"
                env = true
            }

            template {
                data = file("infinispan.xml.tpl")
                destination = "infinispan.xml"
            }


            config {
                image = "bastion/clinical-info-service:0.1"
                ports = ["http"]
                volumes = ["infinispan.xml:/opt/config/infinispan.xml"]
            }

            resources {
                cpu    = 500
                memory = 256
            }
        }
    }


    group "cache-invalidate-service" {
        network {
            mode = "bridge"
            port "http" {
                to = 9002
            }
        }

        service {
            name = "cache-invalidate-service"
            port = 9002
            connect {
                sidecar_service {
                    proxy {
                        upstreams {
                            destination_name = "cache"
                            local_bind_port  = 11222
                        }
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

            template {
                data = file("cache-invalidate-service.env.tpl")
                destination = "cache-invalidate-service.env"
                env = true
            }

            template {
                data = file("infinispan.xml.tpl")
                destination = "infinispan.xml"
            }

            config {
                image = "bastion/cache-invalidate-service:0.1"
                ports = ["http"]
                volumes = ["infinispan.xml:/opt/config/infinispan.xml"]
            }

            resources {
                cpu    = 500
                memory = 256
            }
        }
    }
}