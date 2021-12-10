output "project_repository_project_url" {
  value = "${google_artifact_registry_repository.project.location}-docker.pkg.dev/${google_artifact_registry_repository.project.project}/${google_artifact_registry_repository.project.name}"
}



output "project_service_account" {
  value = google_service_account.project
}

output "project_service_account_binding" {
  value = google_artifact_registry_repository_iam_binding.project_sa_binding
}
