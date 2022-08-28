terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.8.0"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure = true
  pm_api_url      = var.proxmox_uri
  pm_api_token_id         = var.proxmox_user
  pm_api_token_secret     = var.proxmox_pass
}

module "vms" {
  source = "github.com/cflanagan40/proxmox-cloud-init.git"
  count = 2 
  vm_name = "node-${count.index}"
}

module "nfs" {
  source = "github.com/cflanagan40/proxmox-cloud-init.git"
  count = 1
  vm_name = "nfs-${count.index}"
  cpu = 2
  memory = 2048
}

resource "local_file" "ansible_inventory" {
  content = templatefile("templates/hosts.tpl",{
    vms_ip = module.vms.*.default_ipv4_address,
    nfs_ip = module.nfs.*.default_ipv4_address
  })
  filename = "inventory"
}

output "nfs_ip" {
  value = module.nfs.*.default_ipv4_address
}

output "vms_ip" {
  value = module.vms.*.default_ipv4_address
}

