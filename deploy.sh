#!/bin/bash

echo "Installing Nginx..."
sudo dnf install nginx -y

echo "Deploying application..."
sudo cp index.html /usr/share/nginx/html/index.html

echo "Restarting Nginx..."
sudo systemctl enable nginx
sudo systemctl restart nginx

echo "Deployment complete ✅"
