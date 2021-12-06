data "google_project" "master" {
}

data "google_storage_bucket" "master" {
  name          = local.master_storage_account_name
}
