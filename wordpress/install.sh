#!/bin/bash
echo "Waiting for wordpress installation."
sleep 60s
# Apply the namespace configuration
sudo kubectl apply -f /home/user/wordpress/mysql-deployment.yaml
echo "Mysql applied."
sleep 5s
# Apply the namespace configuration
sudo kubectl apply -f /home/user/wordpress/wordpress-deployment.yaml
echo "Wordpress applied."
sleep 5s
# Apply the namespace configuration
sudo kubectl apply -f /home/user/wordpress/services.yaml
echo "Service applied."
sleep 200s
# Apply the namespace configuration
sudo kubectl get all
echo "Service applied."
sleep 30s