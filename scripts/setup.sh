#!/usr/bin/env bash

sudo yum install -y httpd
sudo systemctl enable httpd

sudo chown -R ec2-user:apache /var/www

sudo cat << EOF > /var/www/html/index.html
<h2>Host "$HOSTNAME" is online!</h2>
EOF

echo "Content of index.html file"
cat /var/www/html/index.html