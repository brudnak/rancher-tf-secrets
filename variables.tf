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
