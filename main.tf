resource "proxmox_vm_qemu" "proxmox_vm_master" {
    count       = var.num_k8s_masters_host
    name        = "${var.num_k8s_masters_name}-${count.index}"
    target_node = var.pm_node_name
    clone       = var.tamplate_vm_name
    os_type     = "cloud-init"
    agent       = 1
    memory      = var.num_k8s_masters_mem
    sockets     = "1"
    cores       = var.num_k8s_workers_cpu
    full_clone  = true
    scsihw      = "virtio-scsi-pci"

    disks {
        ide {
            ide3 {
                cloudinit {
                    storage = var.storage_name_location
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    size            = var.num_k8s_masters_disk
                    storage         = var.storage_name_location
                    iothread        = false
                    discard         = false
                }
            }
        }
    }

    network {
        model = "virtio"
        bridge = "vmbr0"
    }

    ipconfig0 = "ip=${var.master_ips[count.index]}/${var.networkrange},gw=${var.gateway}"

    lifecycle {
        ignore_changes = [
        ciuser,
        sshkeys,
        disks,
        network
        ]
    }

    sshkeys = <<EOF
    ${var.pub_key}
    EOF
}

resource "proxmox_vm_qemu" "proxmox_vm_workers" {
    count       = var.num_k8s_workers_host
    name        = "${var.num_k8s_workers_name}-${count.index + 1}"
    target_node = var.pm_node_name
    clone       = var.tamplate_vm_name
    os_type     = "cloud-init"
    agent       = 1
    memory      = var.num_k8s_workers_mem
    sockets     = "1"
    cores       = var.num_k8s_workers_cpu
    full_clone  = true
    scsihw      = "virtio-scsi-pci"

    disks {
        ide {
            ide3 {
                cloudinit {
                    storage = var.storage_name_location
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    size            = var.num_k8s_workers_disk
                    storage         = var.storage_name_location
                    iothread        = false
                    discard         = false
                }
            }
        }
    }

    network {
        model = "virtio"
        bridge = "vmbr0"
    }

    ipconfig0 = "ip=${var.worker_ips[count.index]}/${var.networkrange},gw=${var.gateway}"

    lifecycle {
        ignore_changes = [
        ciuser,
        sshkeys,
        disks,
        network
        ]
    }


    sshkeys = <<EOF
    ${var.pub_key}
    EOF
}

provider "null" {
    # Provider kosong untuk menjalankan perintah lokal
}

resource "null_resource" "run_local_script" {
    depends_on = [proxmox_vm_qemu.proxmox_vm_master, proxmox_vm_qemu.proxmox_vm_workers]

    provisioner "local-exec" {
    command = "bash kubernetes/install.sh"
    }
}

# CREATE TAR FOR FOLDER
resource "null_resource" "create_tar" {
    depends_on = [null_resource.run_local_script]

    provisioner "local-exec" {
        command = "tar -cvf nginx.tar nginx/"
    }
    provisioner "local-exec" {
        command = "tar -cvf wordpress.tar wordpress/"
    }
}

# UPLOAD TAR TO MASTER
resource "null_resource" "upload_tar" {
    depends_on = [null_resource.create_tar, proxmox_vm_qemu.proxmox_vm_master]

    provisioner "file" {
        source      = "nginx.tar"
        destination = "/home/user/nginx.tar"
    }

    provisioner "file" {
        source      = "wordpress.tar"
        destination = "/home/user/wordpress.tar"
    }

    connection {
        type        = "ssh"
        host        = "192.168.1.200"
        user        = "user"
        private_key = file("~/.ssh/id_rsa")
    }
}

# EXTRACT TAR TO MASTER
resource "null_resource" "extract_tar" {
    depends_on = [null_resource.upload_tar, proxmox_vm_qemu.proxmox_vm_master]

    provisioner "remote-exec" {
        inline = [
        "sudo tar -xvf /home/user/nginx.tar",
        "sudo chmod -R +x /home/user/nginx/install.sh",
        "sudo bash /home/user/nginx/install.sh",
        "sudo tar -xvf /home/user/wordpress.tar",
        "sudo chmod -R +x /home/user/wordpress/install.sh",
        "sudo bash /home/user/wordpress/install.sh",
        ]

    connection {
        type        = "ssh"
        host        = "192.168.1.200"
        user        = "user"
        private_key = file("~/.ssh/id_rsa")
    }
    }
}
