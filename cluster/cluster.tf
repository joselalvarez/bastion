provider "nomad" {
    address = "http://10.0.2.15:4646"
}

variable "nginx_expose_port" {
    type = number
    default = 9080
}

variable "cache_expose_port" {
    type = number
    default = 11222
}

variable "bastion_client_secret" {
    type = string
    default = "bx0zeB9e2g6T5ZM2Q1GHpYlIf2CGdNQZ"
}

resource "nomad_job" "cluster-ingress" {
    jobspec = file("cluster-ingress.nomad.hcl")
    hcl2 {
        allow_fs = true
        vars = {
            "nginx_expose_port" = var.nginx_expose_port
            "cache_expose_port" = var.cache_expose_port
        }
    }
}

resource "nomad_job" "cluster-keycloak" {
    jobspec = file("cluster-keycloak.nomad.hcl")
    hcl2 {
        allow_fs = true
        vars = {
            "bastion_client_secret" = var.bastion_client_secret
        }
    }
}

resource "nomad_job" "cluster-cache" {
    jobspec = file("cluster-cache.nomad.hcl")
    hcl2 {
        allow_fs = true
    }
}

resource "nomad_job" "cluster-services" {
    jobspec = file("cluster-services.nomad.hcl")
    hcl2 {
        allow_fs = true
    }
}

resource "nomad_job" "cluster-kafka" {
    jobspec = file("cluster-kafka.nomad.hcl")
    hcl2 {
        allow_fs = true
    }
}