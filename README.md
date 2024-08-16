# Terraform dengan Kubernetes

Proyek ini menggunakan Terraform untuk mengelola infrastruktur di platform Proxmox, di mana kami menginstal Kubernetes dan menyebarkan aplikasi WordPress di dalamnya. Proyek ini bertujuan untuk memberikan solusi yang mudah dan otomatis untuk mengatur lingkungan pengembangan dan produksi.

## Fitur

- Mengelola infrastruktur menggunakan Terraform.
- Menginstal dan mengonfigurasi Kubernetes secara otomatis.
- Menyebarkan aplikasi WordPress di dalam kluster Kubernetes.
- Menggunakan Proxmox sebagai platform virtualisasi.

## Version

- **Proxmox VE**: Versi 8.2
- **Kubernetes**: Versi terbaru (latest)
- **WordPress**: Versi terbaru (latest)
- **MySQL**: Versi 8.0
- **Plugin Proxmox Telmate/Proxmox**: Versi 3.0.1-rc3
- **Terraform**: Versi terbaru
- **kubectl**: Versi terbaru (untuk mengelola kluster Kubernetes)

## Prasyarat

Sebelum memulai, pastikan Anda telah memenuhi syarat berikut:

- mempunyai username: user, dan akses root
- sudah mempunyai template cloud init
- membuat user api proxmox
- mengganti hosts.ini dengan ip yang akan digunakan
- sesuaikan wordpress/mysql-deployment.yaml, wordpress/wordpress-deployment.yaml
- sesuaikan variables.tfvars setelah anda mengcopy dari sample

## Instalasi
1. git clone https://github.com/ForensicID/terraform-kubernetes.git
2. cd terraform-kubernetes
3. cp -R variables.tfvars.sample variables.tfvars
4. terraform init
5. terraform plan -var-file=variables.tfvars
6. terraform apply -var-file=variables.tfvars
