#!/bin/bash

echo "Installing Apache and PHP..."

# Install Apache and PHP
sudo dnf install -y httpd php php-cli

echo "Starting Apache..."

# Start and enable Apache
sudo systemctl enable httpd
sudo systemctl start httpd

echo "Deploying PHP application..."

# Create a simple PHP app
sudo bash -c 'cat > /var/www/html/index.php <<EOF
<?php
echo "<h1>PHP App Deployed via Jenkins ✅</h1>";
echo "<p>Server Time: " . date("Y-m-d H:i:s") . "</p>";
?>
EOF'

echo "Restarting Apache..."
sudo systemctl restart httpd

echo "Deployment complete ✅"
