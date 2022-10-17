module "vmbackup" {
  source = "./modules/compute/virtual_machines_resource_associations"
  
  for_each        = try(var.vmbackup, {}) : key => value
  settings        = each.value
  global_settings = local.global_settings
}

output "vmbackup" {
    value = module.vmbackup
}
