locals {
  instance = "${local.project}.${var.instance_name}"

  instance_clean = replace(local.instance, "/[^A-Za-z0-9-]/", "-")

  instance_tags = merge(local.project_tags, {
                   "instance" = local.instance_clean,
                   scope="instance", 
                   "${local.instance_clean}-instance" = local.instance_clean,
                   "${local.instance_clean}-scope" = "instance",
                  }   )

  instance_signature = local.instance
  instance_signature_clean = replace(local.instance_signature, "/[^A-Za-z0-9-]/", "-")
  instance_signature_clean_53 = length(local.instance_signature_clean) > 53 ? substr(local.instance_signature_clean,length(local.instance_signature_clean)-53,53) : local.instance_signature_clean
  instance_signature_clean_28 = length(local.instance_signature_clean) > 28 ? substr(local.instance_signature_clean,length(local.instance_signature_clean)-28,28) : local.instance_signature_clean

  instance_storage_account_name = length(var.instance_storage_account_name) > 0 ? var.instance_storage_account_name : local.instance_signature_clean_53
}
