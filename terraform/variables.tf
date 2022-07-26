variable "project" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "Compute region"
  default     = "europe-west4"
}

variable "zone" {
  type        = string
  description = "Compute zone"
  default     = "europe-west4-a"
}

variable "serverless_connector_name" {
  type        = string
  description = "Name of serverless connector to use"
  default     = null
}

variable "project_network" {
  type        = string
  description = "Network on which to connect resources"
  default     = "default"
}

variable "topic_name" {
  type        = string
  description = "API events topic name"
  default     = "api-events"
}

variable "container_repo" {
  type        = string
  description = "Name of container repository"
  default     = "default"
}

variable "container_image_db" {
  type        = string
  description = "Container image tag"
}

variable "container_image_api" {
  type        = string
  description = "Container image tag"
}

variable "mongodb_username" {
  type        = string
  description = "MongoDB username"
  default     = "app"
}

variable "mongodb_password_secret" {
  type        = string
  description = "Name of GCP secret containing MongoDB password"
  default     = "mongodb_app_password"
}

variable "mongodb_password_secret_version" {
  type        = string
  description = "Secret version"
  default     = "1"
}

variable "mongodb_host" {
  type        = string
  description = "MongoDB host string with optional port"
}

variable "mongodb_replica_set" {
  type        = string
  description = "MongoDB Replica Set name"
  default     = null
}

variable "mongodb_database" {
  type        = string
  default     = "app"
  description = "MongoDB database name"
}

variable "mongodb_proto" {
  type        = string
  default     = "mongodb"
  description = "MongoDB Protocol"

  validation {
    condition     = can(regex("^mongodb", var.mongodb_proto))
    error_message = "Must begin with `mongodb`."
  }

}

variable "mongodb_tls_dir" {
  type        = string
  description = "Directory path where MongoDB TLS certificates are stored in the container"
  default     = "/etc/mongodb-tls"
}

variable "mongodb_tls_ca_crt_secret" {
  type        = string
  description = "Name of secret containing CA certificate"
  default     = null
}

variable "mongodb_tls_key_secret" {
  type        = string
  description = "Name of secret containing TLS certificate and key"
  default     = null
}

variable "mongodb_tls_key_password_secret" {
  type        = string
  description = "Name of secret containing TLS private key"
  default     = null
}

variable "mongodb_tls_key_password_secret_version" {
  type        = string
  description = "Secret version"
  default     = "1"
}
