module "virtual_machines_resource_associations" {
  source = "./modules/compute/virtual_machines_resource_associations"
  global_settings = local.global_settings
  settings        = each.value
}
  
output "virtual_machines_resource_associations" {
  value = module.virtual_machines_resource_associations
}
