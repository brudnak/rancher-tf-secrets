terraform {
  required_providers {
    rancher2 = {
      source  = "rancher/rancher2"
      version = "1.22.2"
    }
  }
}

provider "rancher2" {
  api_url   = var.rancher_url
  token_key = var.rancher_token_key
  insecure  = true
}

# Create a new rancher2 Namespaced Secret
resource "rancher2_secret" "rancher2_secret" {
  count = var.rancher_secret_count

  name         = "tf-secret-${count.index}"
  description  = "Secret created by Terraform"
  project_id   = var.project_id
  namespace_id = var.namespace_id
  data = {
    tf-secret-string1 = base64encode("topsecret-one-${count.index}")
    tf-secret-string2 = base64encode("topsecret-two-${count.index}")
  }
}

# Variable section

variable "rancher_url" {
  type        = string
  description = "URL for Rancher."
}

variable "rancher_token_key" {
  type        = string
  description = "API bearer token for Rancher."
  sensitive   = true
}

variable "project_id" {
  type        = string
  description = "The project ID where you want to create the secret."
}

variable "namespace_id" {
  type        = string
  description = "The namespace ID where you want to create the secret."
}

variable "secret_count" {
  type        = number
  description = "Amount of secrets that you would like to create within Rancher."
}

