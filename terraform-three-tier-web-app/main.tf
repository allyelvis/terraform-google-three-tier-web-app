resource "google_compute_network" "default" {
  name = var.network_name
}

resource "google_compute_subnetwork" "default" {
  name          = var.subnetwork_name
  network       = google_compute_network.default.id
  ip_cidr_range  = "10.0.0.0/24"
  region         = var.region
}

# Web Server Tier
resource "google_compute_instance" "web_server" {
  name         = "web-server-instance"
  machine_type = var.frontend_instance_type
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network    = google_compute_network.default.id
    subnetwork = google_compute_subnetwork.default.id
  }

  tags = ["web-server"]
}

# Database Tier
resource "google_sql_database_instance" "db" {
  name             = "accounting-db"
  database_version = "POSTGRES_13"
  region           = var.region

  settings {
    tier = var.database_instance_type
  }
}

resource "google_sql_database" "accounting" {
  name     = "accounting_db"
  instance = google_sql_database_instance.db.name
}
