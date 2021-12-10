resource "google_storage_bucket" "project_web" {
  name          = format("%s-web", local.project_storage_account_name)
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

resource "google_storage_bucket_iam_binding" "project_web_all_users" {
  bucket = google_storage_bucket.project_web.name
  role = "roles/storage.objectViewer"
  members = [
    "user:tsbo@gft.com",
  ]
}