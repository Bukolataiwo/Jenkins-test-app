#!/bin/bash

echo "Downloading Splunk..."

# Download Splunk (trial version)
wget -O /tmp/splunk.tgz https://download.splunk.com/products/splunk/releases/9.0.0/linux/splunk-9.0.0-Linux-x86_64.tgz

echo "Installing Splunk..."

# Extract Splunk
sudo tar -xvzf /tmp/splunk.tgz -C /opt

echo "Starting Splunk..."

# Start Splunk and accept license
sudo /opt/splunk/bin/splunk start --accept-license --answer-yes --no-prompt

# Enable auto start
sudo /opt/splunk/bin/splunk enable boot-start

echo "Splunk deployment complete ✅"
