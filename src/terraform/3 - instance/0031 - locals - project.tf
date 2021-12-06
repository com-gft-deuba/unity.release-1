locals {
  project = "${local.customer}.${var.project_name}"

  project_clean = replace(local.project, "/[^A-Za-z0-9-]/", "-")

  project_tags = merge(local.master_tags, {
                   "project" = local.project_clean,
                   scope="instance", 
                   "${local.project_clean}-project" = local.project_clean,
                   "${local.project_clean}-scope" = "instance",
                  }   )

  project_signature = local.project
  project_signature_clean = replace(local.project_signature, "/[^A-Za-z0-9-]/", "-")
  project_signature_clean_53 = length(local.project_signature_clean) > 53 ? substr(local.project_signature_clean,length(local.project_signature_clean)-53,53) : local.project_signature_clean

  project_storage_account_name = length(var.project_storage_account_name) > 0 ? var.project_storage_account_name : local.project_signature_clean_53

  # curl -s checkip.amazonaws.com
  authorized_source_ranges    = [ "37.201.195.0/24" ]
}
