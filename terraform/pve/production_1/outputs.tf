output "virtualization_results" {
  description = "Results of virtualization on production_1"
  value = [
    {
      name = module.production_1_ubuntu.container_name
      ip   = module.production_1_ubuntu.container_ip
      user = module.production_1_ubuntu.container_user_name
    },
    {
      name = module.production_1_alpine.container_name
      ip   = module.production_1_alpine.container_ip
      user = module.production_1_alpine.container_user_name
    },
    {
      name = module.production_1_debian.container_name
      ip   = module.production_1_debian.container_ip
      user = module.production_1_debian.container_user_name
    }
  ]
}
