variable "location" {
  type    = string
  default = "uksouth"
}
variable "environment" {
  type        = string
  description = "The staging environment being deployed into"
  default     = "Dev"
}

variable "rg_name" {
  type    = string
  default = "rg-test"
}

variable "soft_delete_retention_days" {
  type        = number
  description = "The number of days that soft deleted items should be retained"
  default     = 7
}

variable "kv_name" {
  type        = string
  description = "The name to assign to the Key Vault."
  default = "kv-asc-00766"
}

variable "tags" {
  type        = map
  default     = {}
}

