module "resource_association" {
  source = "./modules/compute/virtual_machines"

  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = var.source_vm_id
  backup_policy_id    = var.backup_policy_id
}
