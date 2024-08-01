resource "proxmox_vm_qemu" "ubuntu-vm" {
  name        = "ubuntu-vm"
  target_node = "pve"
  clone       = "ubuntu-22.04-template"
  agent       = 1
  cores       = 2
  memory      = 2048
  scsihw      = "virtio-scsi-pci"
  boot        = "order=scsi0"
  sshkeys     = file("~/.ssh/id_rsa.pub")
  ipconfig0   = "ip=dhcp"
  #ipconfig0   = "ip=192.168.1.11/24,gw=192.168.1.1"
  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = "20G"
        }
      }
    }
    ide {
      ide2 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }
  network {
    bridge    = "vmbr0"
    model     = "virtio"
  }
}