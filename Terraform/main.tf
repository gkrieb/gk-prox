terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      #version = "7.3.0-3"
    }
  }
}

provider "proxmox" {
  pm_api_url = var.api_url
  #pm_api_token_id = var.api_token_id
  #pm_api_token_secret = var.api_token_secret
  pm_user = var.tf_user
  pm_password = var.tf_passwd
}


# Ubuntu
# ubuntu-23.04-standard_23.04-1_amd64.tar.zst
resource "proxmox_lxc" "lxc-ubuntu" {

    count = 1
    ostemplate = "kriebel-qnap:vztmpl/ubuntu-23.04-standard_23.04-1_amd64.tar.zst"
    password = var.container_passwd
    pool = "tf_ubuntu"
    target_node = var.target_node
    hostname = "ubuntu-cont-${count.index + 1}"
    unprivileged = true
    start = true
    ssh_public_keys = var.ssh_pub_key
    memory = 4096

    features {
        nesting = true
    }

    network {
        name = "eth0"
        bridge = "vmbr0"
        ip = "192.168.10.14${count.index + 1}/24"
        gw = var.gateway
    }
    rootfs {
      size = "4G"
      storage = "local-lvm"
    }

}
