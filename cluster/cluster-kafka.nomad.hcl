job "cluster-kafka" {

    datacenters = ["dc1"]

    group "kafka" {
        network {
            mode = "bridge"
            port "kf1" {
                to = 9092
            }
            port "kf2" {
                to = 8081
            }
            port "kf3" {
                to = 8082
            }
            port "kf4" {
                to = 9644
            }
        }

        service {
            name = "kafka"
            port = 9092
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

            config {
                image = "vectorized/redpanda:v23.2.8"
                ports = ["kf1","kf2","kf3","kf4"]
                args  = ["start --overprovisioned --smp 1 --memory 1G --reserve-memory 0M --node-id 0 --check=false"]
            }

            resources {
                cpu    = 500
                memory = 1024
            }
        }
    }
}