#!/bin/bash

# Move to /tmp directory
cd /tmp

# Update the package manager
sudo apt update -y
sudo apt upgrade -y

# Install the SSM Agent
# First, we need to download and install the AWS SSM Agent package for Ubuntu
curl "https://github.com/aws/amazon-ssm-agent/releases/download/v3.0.611.0/amazon-ssm-agent-3.0.611.0-1.x86_64.deb" -o amazon-ssm-agent.deb

# Install the SSM Agent
sudo dpkg -i amazon-ssm-agent.deb

# Enable and start the SSM Agent
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent





