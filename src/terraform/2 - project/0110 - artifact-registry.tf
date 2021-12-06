resource "google_artifact_registry_repository" "project" {
  provider = google-beta

  location      = lower(data.google_storage_bucket.master.location)
  repository_id = "project"
  description   = "Project docker images"
  format = "DOCKER"

  labels = local.project_tags
}
