module "virtual_machines_resource_associations" {
  source = "./modules/compute/virtual_machines_resource_associations"
  
  for_each = try(var.virtual_machines_resource_associations, {}) : key => value
  settings            = each.value
  global_settings     = local.global_settings
}

  output "virtual_machines_resource_associations" {
  value = module.virtual_machines_resource_associations
}
