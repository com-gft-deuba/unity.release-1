# variable "service_principal_displayname" {
#   description = "Display name of the service principal."
#   type        = string
#   sensitive   = true
# }

# variable "service_principal_password" {
#   description = "Password name of the service principal."
#   type        = string
#   sensitive   = true
# }

variable "domain_name" {
  description = "Domain of this project."
  type        = string
  default     = "com.gft"
}

variable "customer_name" {
  description = "Name of this project."
  type        = string
  default     = "deuba"
}

variable "master_project_name" {
  description = "Name of this project."
  type        = string
  default     = "gcp"
}

variable "master_storage_account_name" {
  description = "Name of the storage account to store terraform states."
  type        = string
  default     = ""
}

