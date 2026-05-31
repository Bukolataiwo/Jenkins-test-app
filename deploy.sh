#!/bin/bash

echo "Installing Apache, PHP, and MySQL (MariaDB)..."

# Install Apache + PHP + MariaDB
sudo dnf install -y httpd php php-cli mariadb-server

echo "Stopping Nginx (avoid port conflict)..."
sudo systemctl stop nginx || true
sudo systemctl disable nginx || true

echo "Starting Apache..."
sudo systemctl enable httpd
sudo systemctl start httpd

echo "Starting MariaDB..."
sudo systemctl enable mariadb
sudo systemctl start mariadb

echo "Configuring database..."

# Secure MySQL setup (basic, non-interactive)
sudo mysql -e "CREATE DATABASE myapp;"
sudo mysql -e "CREATE USER 'appuser'@'localhost' IDENTIFIED BY 'password123';"
sudo mysql -e "GRANT ALL PRIVILEGES ON myapp.* TO 'appuser'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

echo "Deploying PHP app with DB connection..."

sudo bash -c 'cat > /var/www/html/index.php <<EOF
<?php
\$conn = new mysqli("localhost", "appuser", "password123", "myapp");

if (\$conn->connect_error) {
    die("<h1>Database connection failed ❌</h1>");
}

echo "<h1>PHP + MySQL App ✅</h1>";
echo "<p>Database Connected Successfully!</p>";
?>
EOF'

echo "Restarting Apache..."
sudo systemctl restart httpd

echo "Deployment complete ✅"
