locals {
  // Tags to be used with all objects that support it.
  domain         = var.domain_name
  customer       = "${local.domain}.${var.customer_name}"
  master_project = "${local.customer}.${var.master_project_name}"

  domain_clean         = replace(local.domain, "/[^A-Za-z0-9-]/", "-")
  customer_clean       = replace(local.customer, "/[^A-Za-z0-9-]/", "-")
  master_project_clean = replace(local.master_project, "/[^A-Za-z0-9-]/", "-")

  master_tags = {
    domain                                   = local.domain_clean
    customer                                 = local.customer_clean
    project                                  = local.master_project_clean
    scope                                    = "organisation"
    "${local.master_project_clean}-domain"   = local.domain_clean
    "${local.master_project_clean}-customer" = local.customer_clean
    "${local.master_project_clean}-project"  = local.master_project_clean
    "${local.master_project_clean}-scope"    = "organisation"
  }

  master_signature       = local.master_project
  master_signature_clean = replace(local.master_signature, "/[^A-Za-z0-9-]/", "-")
  master_signature_clean_53 = length(local.master_signature_clean) > 53 ? substr(local.master_signature_clean,length(local.master_signature_clean)-53,53) : local.master_signature_clean
  master_signature_minimal    = replace(local.master_signature, "/[^A-Za-z0-9-]/", "")
  master_signature_underscore = replace(local.master_signature, "/[^A-Za-z0-9_]/", "_")

  master_storage_account_name = length(var.master_storage_account_name) > 0 ? var.master_storage_account_name : local.master_signature_clean_53


}
