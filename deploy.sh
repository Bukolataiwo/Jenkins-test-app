#!/bin/bash

echo "Installing Docker..."

# Install Docker
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io

echo "Starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Running a Docker container..."

# Run a simple test container
sudo docker run -d -p 8081:80 nginx

echo "Docker deployment complete ✅"
