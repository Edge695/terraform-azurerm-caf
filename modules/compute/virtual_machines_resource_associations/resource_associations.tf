resource "azurerm_backup_protected_vm" "backup" {
  resource_group_name = try(var.resource_group_name, null)
  recovery_vault_name = try(var.recovery_vault_name, null)
  backup_policy_id    = try(var.backup_policy_id, null)
  source_vm_id        = try(var.source_vm_id, null)
}
