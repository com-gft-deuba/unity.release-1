resource "google_artifact_registry_repository" "project" {
  provider = google-beta

  location      = lower(data.google_storage_bucket.master.location)
  repository_id = "project"
  description   = "Project docker images"
  format = "DOCKER"

  labels = local.project_tags
}


resource "google_service_account" "project" {
  account_id   = local.project_signature_clean_28
  display_name = local.project_signature_clean
  description  = "Service account for gcc access to images."
}


resource "google_artifact_registry_repository_iam_binding" "project_sa_binding" {
  provider = google-beta

  project = google_artifact_registry_repository.project.project
  location = google_artifact_registry_repository.project.location
  repository = google_artifact_registry_repository.project.name
  role = "roles/artifactregistry.reader"

  members = [
    "serviceAccount:${google_service_account.project.email}",
  ]
}

