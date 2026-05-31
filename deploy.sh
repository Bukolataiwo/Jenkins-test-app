#!/bin/bash

echo "Installing Apache and PHP..."
sudo dnf install -y httpd php php-cli

echo "Configuring Apache to use port 8082..."

# Change port from 80 → 8082
sudo sed -i 's/^Listen 80/Listen 8082/' /etc/httpd/conf/httpd.conf

echo "Starting Apache..."

sudo systemctl enable httpd
sudo systemctl restart httpd

echo "Deploying PHP app..."

sudo bash -c 'cat > /var/www/html/index.php <<EOF
<?php
echo "<h1>Apache + PHP App ✅</h1>";
echo "<p>Running on port 8082</p>";
?>
EOF'

echo "Restarting Apache..."
sudo systemctl restart httpd

echo "Deployment complete ✅"
