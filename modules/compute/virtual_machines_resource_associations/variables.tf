variable "global_settings" {
  description = "Global settings object (see module README.md)"
}

variable "client_config" {
  description = "Client configuration object (see module README.md)."
}

variable "settings" {
  description = "Settings object."
}

variable "resource_group_name" {}
variable "recovery_vault_name" {}
variable "source_vm_id" {}
variable "backup_policy_id" {}
