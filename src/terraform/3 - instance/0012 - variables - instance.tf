variable "instance_name" {
  description = "Name of this instance"
  type        = string
  default     = "demo"
}


variable "instance_storage_account_name" {
  description = "Name of the storage account to store terraform states of the project."
  type        = string
  default     = ""
}

