resource "azurerm_backup_protected_vm" "backup" {
  # for_each            = try(var.settings.resource_association.vmBackup, {})
  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_vault_name
  backup_policy_id    = var.backup_policy_id
  source_vm_id        = var.source_vm_id
}
