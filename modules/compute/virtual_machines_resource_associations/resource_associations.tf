resource "azurerm_backup_protected_vm" "virtual_machine_resource_associations" {
  # resource_group_name = module.rg.resource_group_name
  # recovery_vault_name = try(var.settings.recovery_vault_name)
  # backup_policy_id    = try(var.settings.backup_policy_id)
  # source_vm_id        = try(var.settings.source_vm_id)
    
  resource_group_name = module.resource_groups.resource_group_name
  recovery_vault_name = module.recovery_vaults.name
  backup_policy_id = module.recovery_vaults.backup_policies.id
  source_vm_id = module.virtual_machine.id
}
