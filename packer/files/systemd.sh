#!/bin/bash
tee /lib/systemd/system/puma.service << EOF

[Unit]
Description=Puma-server_Service

[Service]
WorkingDirectory=/home/appuser/reddit
ExecStart=/usr/local/bin/puma
Restart=always
RestartSec=15

[Install]
WantedBy=multi-user.target

EOF
systemctl enable puma.service
systemctl start puma.service
