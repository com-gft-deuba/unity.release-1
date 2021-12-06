data "google_storage_bucket" "project" {
  name          = local.project_storage_account_name
}

# data "google_artifact_registry_repository" "project" {
#   repository_id = "project"
# }

# data "google_compute_network" "project" {
#   name                    = local.project_signature_clean
# }
#  
# data "google_compute_subnetwork" "project" {
#   name          = local.project_signature_clean
# }
# 
# data "google_compute_address" "project" {
#   name    = local.project_signature_clean
# }
#  
# data "google_service_account" "project" {
#   account_id   = local.project_signature_clean
# }
# 
