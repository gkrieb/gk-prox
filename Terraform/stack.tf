generate_hcl "prox-test.tf" {
  content {

    terraform {
    required_providers {
        proxmox = {
        source  = "telmate/proxmox"
        #version = "7.3.0-3"
        }
    }
    }

    provider "proxmox" {
    pm_api_url = "${global.api_url}"
    pm_api_token_id = "${global.api_token_id}"
    pm_api_token_secret = "${global.api_token_secret}"
    #pm_user = "${global.tf_user}
    #pm_password = "${global.tf_passwd}""
    }

    # Ubuntu
    # ubuntu-23.04-standard_23.04-1_amd64.tar.zst
    resource "proxmox_lxc" "lxc-ubuntu" {

        count = 5
        ostemplate = "kriebel-qnap:vztmpl/ubuntu-23.04-standard_23.04-1_amd64.tar.zst"
        password = "${global.container_passwd}"
        pool = "tf_ubuntu"
        target_node = "${global.target_node}"
        hostname = "tm-cont-${count.index + 1}"
        unprivileged = true
        start = true
        ssh_public_keys = "${global.ssh_pub_key}"

        features {
            nesting = true
        }

        network {
            name = "eth0"
            bridge = "vmbr0"
            ip = "192.168.10.13${count.index + 1}/24"
            gw = "${global.gateway}"
        }
        rootfs {
        size = "1G"
        storage = "local-lvm"
        }

    }
  }
}