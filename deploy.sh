#!/bin/bash

echo "Downloading Splunk..."

# Use a VALID Splunk download URL
wget -O /tmp/splunk.tgz https://download.splunk.com/products/splunk/releases/9.1.0/linux/splunk-9.1.0-linux-2.6-x86_64.tgz

echo "Installing Splunk..."

# Clean old install if exists
sudo rm -rf /opt/splunk

# Extract Splunk
sudo tar -xvzf /tmp/splunk.tgz -C /opt

echo "Starting Splunk..."

# Start Splunk
sudo /opt/splunk/bin/splunk start --accept-license --answer-yes --no-prompt

# Enable at boot
sudo /opt/splunk/bin/splunk enable boot-start

echo "Splunk deployment complete ✅"
