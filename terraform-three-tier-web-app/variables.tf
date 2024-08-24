variable "project_id" {
  description = "The ID of the Google Cloud project."
  type        = string
}

variable "region" {
  description = "The region for the resources."
  type        = string
  default     = "us-central1"
}

variable "network_name" {
  description = "The name of the VPC network."
  type        = string
  default     = "my-network"
}

variable "subnetwork_name" {
  description = "The name of the subnetwork."
  type        = string
  default     = "my-subnetwork"
}

variable "frontend_instance_type" {
  description = "Instance type for the frontend."
  type        = string
  default     = "e2-medium"
}

variable "database_instance_type" {
  description = "Instance type for the database."
  type        = string
  default     = "db-f1-micro"
}
