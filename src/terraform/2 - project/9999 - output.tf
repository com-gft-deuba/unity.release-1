output "project_repository_project_url" {
  value = "${google_artifact_registry_repository.project.location}-docker.pkg.dev/${google_artifact_registry_repository.project.project}/${google_artifact_registry_repository.project.name}"
}



