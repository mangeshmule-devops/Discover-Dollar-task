#!/bin/bash
set -e

sudo apt update -y
sudo apt install -y docker.io docker-compose git
sudo systemctl enable --now docker
sudo usermod -aG docker ubuntu

cd /home/ubuntu
git clone https://github.com/mangeshmule-devops/Discover-Dollar-task.git
cd Discover-Dollar-task
sudo docker-compose up -d --build

echo "Deployment Completed 🚀"
