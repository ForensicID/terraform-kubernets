terraform init
terraform plan -var-file=variable.tfvars
terraform apply -var-file=variable.tfvars



ansible-playbook -i hosts.ini ansible-wordpress.yaml