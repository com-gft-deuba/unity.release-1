variable "project_name" {
  description = "Name of this project."
  type        = string
  default     = "unity.release-1"
}

variable "project_storage_account_name" {
  description = "Name of the storage account to store terraform states of the project."
  type        = string
  default     = ""
}

