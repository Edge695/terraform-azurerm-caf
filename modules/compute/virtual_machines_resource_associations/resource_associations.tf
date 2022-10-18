resource "azurerm_backup_protected_vm" "backup" {
  # resource_group_name = module.rg.resource_group_name
  # recovery_vault_name = try(var.settings.recovery_vault_name)
  # backup_policy_id    = try(var.settings.backup_policy_id)
  # source_vm_id        = try(var.settings.source_vm_id)
    
  resource_group_name = coalesce(
    try(var.settings.backup.backup_vault_rg, null),
    try(split("/", var.settings.backup.backup_vault_id)[4], null),
    try(var.recovery_vaults[var.client_config.landingzone_key][var.settings.backup.vault_key].resource_group_name, null),
    try(var.recovery_vaults[var.settings.backup.lz_key][var.settings.backup.vault_key].resource_group_name, null)
  )
  
  recovery_vault_name = module.recovery_vaults.name
  backup_policy_id = module.recovery_vaults.backup_policies.id
  source_vm_id = module.virtual_machine.id
}
