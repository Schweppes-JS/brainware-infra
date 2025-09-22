[development]
%{ for virtualization_result in development_1_virtualization_results ~}
${virtualization_result.name} ansible_host=${split("/", virtualization_result.ip)[0]} ansible_user=${virtualization_result.user} ansible_port=22
%{ endfor ~}

[staging]
%{ for virtualization_result in staging_1_virtualization_results ~}
${virtualization_result.name} ansible_host=${split("/", virtualization_result.ip)[0]} ansible_user=${virtualization_result.user} ansible_port=22
%{ endfor ~}

[all:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

