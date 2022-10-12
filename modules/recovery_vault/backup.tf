
resource "azurerm_backup_protected_vm" "backup" {
  for_each = try(var.settings.backup, {})
    resource_group_name         = try(var.recovery_vaults[var.settings.backup.lz_key][var.settings.backup.vault_key].resource_group_name, null)
    vault_key                   = try(var.recovery_vaults[var.client_config.landingzone_key][var.settings.backup.vault_key], null)
    source_vm_id                = try(var.settings.backup.source_vm_id, null)
    policy_key                  = try(var.settings.backup.policy_key, null)
}
