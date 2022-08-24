Terraform to create infra in proxmox with Ansible enabled images. 

export TF_VAR_proxmox_pass and TF_VAR_proxmox_user in environment

Terraform apply will create inventory ansible can use to install and setup microk8s

Network is setup offline using BGP for ingress as Ubiquiti is fairly limited with Ansible.
