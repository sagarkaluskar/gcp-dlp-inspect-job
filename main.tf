terraform {
  required_version = ">= 1.3.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.gcp_region
}

resource "google_data_loss_prevention_inspect_template" "basic" {
  parent       = "projects/${var.project_id}"
  description  = "basic inspect template"
  display_name = "${var.name_prefix}-inspect"

  inspect_config {
    info_types {
      name = "EMAIL_ADDRESS"
    }
    info_types {
      name = "PHONE_NUMBER"
    }
  }
}
