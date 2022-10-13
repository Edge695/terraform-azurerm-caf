
resource "azurerm_backup_protected_vm" "backup" {
  for_each = try(var.settings.backup, {})
  resource_group_name   = try(var.settings.backup.rg_key.resource_group_name, null)
  recovery_vault_name   = try(var.settings.backup.vault_key.name, null)
  # backup_policy_id    = [var.settings.recovery_vaults.vault_key].backup_policies.virtual_machines[var.settings.recovery_vaults.policy_key].id, null)
  # backup_policy_id    = try(var.settings.backup.backup_policy_id, null)
  # source_vm_id        = try(var.settings.backup.source_vm_id, null)
}
