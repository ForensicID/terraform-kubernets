pm_host = "192.168.1.251"
pm_user = "root@pam!terraform"
pm_password = "d3c1654a-da01-476c-8412-98052cb7f9a2"
pm_node_name = "prx"
pm_tls_insecure = true
pvt_key = "/root/.ssh/id_rsa"
pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAVBIAivf3wL+hLTt9++Xib4j6pnydaKGTZFSea4vThOPFDB4ZhmBnwnFM6YfW0NAg9wJNEAtEsloovrqIaKd/gXS+kyU8qHGEszd2kPA2kZdQcyeSGfwcoliJ9Oyn4Diy3HBkTzOYlSljzxsPxrLTt1c2vf1y4RtcM5xetNyIKBpHztvQae6qPo9LwFDs4dUE0UkSq2set3KOs+JAE+Ke07RV13W9ay7VEDwP6mKduRoLXpCPjT+8m3aRsyYqMgtSRLubqKVmm+kPviL0ZV98o6+N1C1a7VnK+f/2GnL4Ck+lCRgcxe5PDc06rMJ7Sg2VV+9mi3uVh6imZxI92Plz7ktkevZtivFtathQPOQpROB21X7u9jOYafS2y5Ky1AfLV3NcMTSUA+YV+FHdN1Q2SoRDgLQHaKk18rMDzi4bFFCT1cfzGYB0Ccq+HFRwOSLN3QFGEbF3kGctxHlS8JdZZ5tNcLbgykWKcCoh+RHOVxBQwNHp55xSyjb/0ULdm2s= root@proxy"

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