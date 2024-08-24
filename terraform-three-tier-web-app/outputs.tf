output "web_server_ip" {
  value = google_compute_instance.web_server.network_interface[0].network_ip
}

output "database_instance_connection_name" {
  value = google_sql_database_instance.db.connection_name
}
