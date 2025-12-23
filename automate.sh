#!/bin/bash
set -e

apt update -y
apt install -y docker.io nginx

systemctl enable docker nginx
systemctl start docker nginx

usermod -aG docker ubuntu || true

cat <<EOF > /var/www/html/index.html
<h1>Hello There! This is Mainul Alam Mahim</h1>
<ul>
  <li><a href="https://www.linkedin.com/in/mainul-alam-ba147b219" target="_blank">This is my LinkedIn</a></li>
  <li><a href="https://github.com/Mainul41561" target="_blank">This is my GitHub</a></li>
</ul>
EOF
