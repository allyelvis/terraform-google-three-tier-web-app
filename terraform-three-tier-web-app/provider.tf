terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5"
    }
  }

  required_version = ">= 0.12"
}

provider "google" {
  credentials = file("<PATH_TO_YOUR_SERVICE_ACCOUNT_KEY>.json")
  project     = var.project_id
  region      = var.region
}
