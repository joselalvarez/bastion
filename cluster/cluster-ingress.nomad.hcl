variable "nginx_expose_port" {
    type = number
}
variable "cache_expose_port" {
    type = number
}

job "cluster-ingress" {

    datacenters = ["dc1"]

    group "nginx-ingress" {
        network {
            mode = "bridge"
            port "http" {
               static = var.nginx_expose_port
            }
        }

        service {
            name = "nginx-ingress"
            port = "http"
            connect {
                gateway {
                    ingress {
                        listener {
                            port = var.nginx_expose_port
                            protocol = "tcp"
                            service {
                                name = "nginx"
                            }
                        }
                    }
                }
            }
        }
    }

    group "nginx" {
        network {
            mode = "bridge"
            port "http" {
                to = 9080
            }
        }

        service {
            name = "nginx"
            port = 9080
            connect {
                sidecar_service {
                    proxy {
                        upstreams {
                            destination_name = "keycloak"
                            local_bind_port  = 8080
                        }
                        upstreams {
                            destination_name = "clinical-info-service"
                            local_bind_port  = 9001
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
                data = file("nginx.conf.tpl")
                destination = "nginx.conf"
            }

            config {
                image = "nginx:mainline-alpine3.18"
                ports = ["http"]
                volumes = ["nginx.conf:/etc/nginx/nginx.conf"]
            }

            resources {
                cpu    = 100
                memory = 256
            }
        }
    }

    group "cache-ingress" {
        network {
            mode = "bridge"
            port "http" {
               static = var.cache_expose_port
            }
        }

        service {
            name = "cache-ingress"
            port = "http"
            connect {
                gateway {
                    ingress {
                        listener {
                            port = var.cache_expose_port
                            protocol = "tcp"
                            service {
                                name = "cache"
                            }
                        }
                    }
                }
            }
        }
    }
}