#!/usr/bin/env bash
set -ex

sudo yum install -y httpd
sudo systemctl enable httpd

sudo chown -R ec2-user:apache /var/www

sudo mkdir /scripts
sudo chown -R ec2-user:root /scripts
echo "Create script"
script_content='#!/usr/bin/env bash

hostname="$1"

echo "<h2>Host \"$hostname\" is online!</h2>" > /var/www/html/index.html
'

echo -n "$script_content" | sudo tee /scripts/create_html.sh
sudo chmod +x /scripts/create_html.sh

echo "Create service file"
service_content=$(cat << EOF
[Unit]
Description=Creates HTML with hostname
Wants=create_html.timer
After=network.target

[Service]
Type=oneshot
ExecStart=/scripts/create_html.sh "%H"

[Install]
WantedBy=multi-user.target
EOF
)

timer_content=$(cat << EOF
[Unit]
Description=Trigger create_html service
Requires=create_html.service

[Timer]
Unit=create_html.service
OnCalendar=*-*-* *:*:0/5

[Install]
WantedBy=timers.target
EOF
)

echo -n "$service_content" | sudo tee /etc/systemd/system/create_html.service
sudo systemctl enable create_html.service

echo -n "$timer_content" | sudo tee /etc/systemd/system/create_html.timer
sudo systemctl enable create_html.timer
