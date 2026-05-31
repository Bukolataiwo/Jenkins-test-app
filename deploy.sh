#!/bin/bash

echo "Downloading Splunk..."

# VALID Splunk version (tested format)
wget -O /tmp/splunk.tgz "https://download.splunk.com/products/splunk/releases/9.1.2/linux/splunk-9.1.2-linux-2.6-x86_64.tgz"

if [ $? -ne 0 ]; then
    echo "Download failed ❌"
    exit 1
fi

echo "Installing Splunk..."

sudo rm -rf /opt/splunk
sudo tar -xvzf /tmp/splunk.tgz -C /opt

if [ ! -d "/opt/splunk" ]; then
    echo "Installation failed ❌"
    exit 1
fi

echo "Starting Splunk..."

sudo /opt/splunk/bin/splunk start --accept-license --answer-yes --no-prompt
sudo /opt/splunk/bin/splunk enable boot-start

echo "Splunk deployment complete ✅"
``
