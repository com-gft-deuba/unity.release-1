# output "instance_ip" {
#   value = google_compute_address.instance.address
# }

# output "project_repository_project_url" {
#   value = "${data.google_artifact_registry_repository.project.location}-docker.pkg.dev/${data.google_artifact_registry_repository.project.project}/${data.google_artifact_registry_repository.project.name}"
# }

output "instance_gcc" {
  value = google_container_cluster.instance.name
  sensitive = false
}

output "instance_gcc_name" {
  value = google_container_cluster.instance.name
  sensitive = false
}

output "instance_gcc_host" {
  value     = google_container_cluster.instance.endpoint
  sensitive = false
}

output "instance_gcc_ca_certificate" {
  value     = base64decode(google_container_cluster.instance.master_auth.0.cluster_ca_certificate)
  sensitive = false
}

# output "instance_gcc_username" {
#   value     = google_container_cluster.instance.master_auth.0.username
#   sensitive = true
# }

# output "instance_gcc_password" {
#   value     = google_container_cluster.instance.master_auth.0.password
#   sensitive = true
# }

output "instance_gcc_region" {
  value     = google_container_cluster.instance.location
  sensitive = false
}

output "instance_gsa" {
  value     = data.google_service_account.project
  sensitive = false
}
