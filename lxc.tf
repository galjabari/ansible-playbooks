resource "proxmox_lxc" "ubuntu-ct" {
  target_node     = "pve"
  hostname        = "ubuntu-ct"
  ostemplate      = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  password        = "ubuntu"
  unprivileged    = true
  cores           = 2
  memory          = 1024
  start           = false
  ssh_public_keys = file("~/.ssh/id_rsa.pub")
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}