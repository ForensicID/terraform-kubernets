pm_host = "192.168.1.251"
pm_user = "root@pam!terraform"
pm_password = "d3c1654a-da01-476c-8412-98052cb7f9a2"
pm_node_name = "prx"
pm_tls_insecure = true
pub_key = "your-public-key"

num_k8s_masters_name = "k8s-master"
num_k8s_masters_host = 1
num_k8s_masters_cpu = 4
num_k8s_masters_mem = 4096
num_k8s_masters_disk = 32

num_k8s_workers_name = "k8s-worker"
num_k8s_workers_host = 2
num_k8s_workers_cpu = 4
num_k8s_workers_mem = 2048
num_k8s_workers_disk = 32

tamplate_vm_name = "ubuntucloud22"
master_ips = [
  "192.168.1.200"
]
worker_ips = [
  "192.168.1.202",
  "192.168.1.203",
]
