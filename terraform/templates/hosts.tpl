[servers]
%{ for index, ip in vms_ip ~}
${format("controller-%02d", index)} ansible_host=${ip}
%{ endfor ~}

[nfs-servers]
%{ for index, ip in nfs_ip ~}
${format("nfs-%02d", index)} ansible_host=${ip}
%{ endfor ~}

[servers:vars]
ansible_user=ansible

[nfs-servers:vars]
ansible_user=ansible
export_path=/srv/nfs
