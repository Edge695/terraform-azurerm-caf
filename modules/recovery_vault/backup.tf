
resource "azurerm_backup_protected_vm" "backup" {
  for_each = try(var.settings.backup, {})
  
  resource_group_name = coalesce(
    try(var.settings.backup.backup_vault_rg, null),
    try(split("/", var.settings.backup.backup_vault_id)[4], null),
    try(var.recovery_vaults[var.client_config.landingzone_key][var.settings.backup.vault_key].resource_group_name, null),
    try(var.recovery_vaults[var.settings.backup.lz_key][var.settings.backup.vault_key].resource_group_name, null)
  )

  recovery_vault_name = coalesce(
    try(var.settings.backup.backup_vault_name, null),
    try(split("/", var.settings.backup.backup_vault_id)[8], null),
    try(var.recovery_vaults[var.client_config.landingzone_key][var.settings.backup.vault_key].name, null),
    try(var.recovery_vaults[var.settings.backup.lz_key][var.settings.backup.vault_key].name, null)
  )
  
  backup_policy_id = coalesce(
    try(var.settings.backup.backup_policy_id, null),
    try(var.recovery_vaults[var.client_config.landingzone_key][var.settings.backup.vault_key].backup_policies.virtual_machines[var.settings.backup.policy_key].id, null),
    try(var.recovery_vaults[var.settings.backup.lz_key][var.settings.backup.vault_key].backup_policies.virtual_machines[var.settings.backup.policy_key].id, null)
  )

  source_vm_id = try(var.settings.backup.vm_id)
    
}
