terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.34.1"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.24.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }

    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }

    time = {
      source  = "hashicorp/time"
      version = "0.10.0"
    }
  }
}

variable "digitalocean_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

provider "digitalocean" {
  token = var.digitalocean_token
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "helm" {
  kubernetes {
    host  = digitalocean_kubernetes_cluster.demo.endpoint
    token = digitalocean_kubernetes_cluster.demo.kube_config[0].token
    cluster_ca_certificate = base64decode(
      digitalocean_kubernetes_cluster.demo.kube_config[0].cluster_ca_certificate
    )
  }
}

provider "kubectl" {
  # Do not load host's ~/.kube/config or $KUBECONFIG file
  load_config_file = false

  host  = digitalocean_kubernetes_cluster.demo.endpoint
  token = digitalocean_kubernetes_cluster.demo.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.demo.kube_config[0].cluster_ca_certificate
  )
}

provider "null" {}

provider "time" {}
