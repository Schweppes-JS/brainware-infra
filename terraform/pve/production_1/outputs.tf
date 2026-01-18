output "virtualization_results" {
  description = "Results of virtualization on production_1"
  value = [
    {
      name = module.production_1_ubuntu_vm.vm_name
      ip   = module.production_1_ubuntu_vm.vm_ip
      user = module.production_1_ubuntu_vm.vm_user_name
    },
    {
      name = module.production_1_alpine_vm.vm_name
      ip   = module.production_1_alpine_vm.vm_ip
      user = module.production_1_alpine_vm.vm_user_name
    },
  ]
}
