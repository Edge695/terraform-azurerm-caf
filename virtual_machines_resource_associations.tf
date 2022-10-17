module "resource_association_vmbackup" {
  source = "./modules/compute/virtual_machine"

  resource_group_name = try(each.value.resource_group_name)
  recovery_vault_name = try(each.value.recovery_vault_name)
  source_vm_id        = try(each.value.source_vm_id)
  backup_policy_id    = try(each.value.backup_policy_id)
}
