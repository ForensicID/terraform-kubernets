#!/bin/bash
echo "Waiting for wordpress installation."
sleep 60s
# Apply the namespace configuration
sudo kubectl apply -f /home/user/nginx/nginx-deployment.yaml
echo "Created Nginx Deployment."
sleep 5s
# Apply the namespace configuration
sudo kubectl apply -f /home/user/nginx/nginx-service.yaml
echo "Created Nginx Deployment."
sleep 5s
# Apply the namespace configuration
sudo kubectl get all
echo "DONE."
sleep 5s