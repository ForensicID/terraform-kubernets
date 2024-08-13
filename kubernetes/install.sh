#!/bin/bash

sleep 320s

# Variabel
HOST="hosts.ini"

# File known_hosts
KNOWN_HOSTS_FILE="/root/.ssh/known_hosts"

# Ambil daftar host dari file inventori
HOSTS=$(grep ansible_host "$INVENTORY_FILE" | awk -F'=' '{print $2}' | awk '{print $1}')

# Tambahkan kunci SSH ke file known_hosts
for HOST in $HOSTS; do
    echo "Adding $HOST to known_hosts"
    ssh-keyscan -H "$HOST" >> "$KNOWN_HOSTS_FILE"
done

# Execute Ansible playbook to install and configure containerd package on hosts
ansible-playbook -i hosts.ini kubernetes/k8s_containrd_pkg.yml
echo "Containerd package configuration applied."
sleep 300s

# Execute Ansible playbook to initialize the Kubernetes master node
ansible-playbook -i hosts.ini kubernetes/k8s_master_init.yml
echo "Kubernetes master node initialized."
sleep 100s

# Execute Ansible playbook to configure worker nodes
ansible-playbook -i hosts.ini kubernetes/k8s_workers.yml
echo "Kubernetes worker nodes configured."
sleep 200s