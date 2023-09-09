
job "cluster-cache" {

    datacenters = ["dc1"]

    group "cache" {
        network {
            mode = "bridge"
            port "http" {
                to = 11222
            }
        }

        service {
            name = "cache"
            port = 11222
            connect {
                sidecar_service {}
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
                USER = "admin"
                PASS = "admin"
            }

            config {
                image = "quay.io/infinispan/server:14.0"
                ports = ["http"]
            }

            resources {
                cpu    = 500
                memory = 1024
            }
        }
    }
}