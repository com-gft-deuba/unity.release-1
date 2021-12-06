resource "google_storage_bucket" "project" {
  name          = local.project_storage_account_name
  location      = "europe-west3"
  project       = data.google_project.master.project_id
  force_destroy = true
  storage_class = "STANDARD"

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  labels = local.project_tags

}
