output "instance_ip" {
  value = google_compute_address.instance.address
}

# output "project_repository_project_url" {
#   value = "${data.google_artifact_registry_repository.project.location}-docker.pkg.dev/${data.google_artifact_registry_repository.project.project}/${data.google_artifact_registry_repository.project.name}"
# }
