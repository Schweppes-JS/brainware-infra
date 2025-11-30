output "virtualization_results" {
  description = "Results of virtualization on staging_1"
  value = [
    {
      name = module.staging_1_ubuntu.container_name
      ip   = module.staging_1_ubuntu.container_ip
      user = module.staging_1_ubuntu.container_user_name
    },
    {
      name = module.staging_1_alpine.container_name
      ip   = module.staging_1_alpine.container_ip
      user = module.staging_1_alpine.container_user_name
    },
    {
      name = module.staging_1_debian.container_name
      ip   = module.staging_1_debian.container_ip
      user = module.staging_1_debian.container_user_name
    }
  ]
}
