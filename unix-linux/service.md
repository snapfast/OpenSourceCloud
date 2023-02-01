
# Create a Service (systemctl unit) for a Python App

Github link: https://github.com/groovemonkey/sshalert

```

[Unit]
Description=Tutorialinux sshalert service - alerts when someone logs in or sudos

[Install]
WantedBy=multi-user.target

[Service]
Type=simple
ExecStart=/home/sshalert/sshalert/venv/bin/python3 /home/sshalert/sshalert/sshalert.py
EnvironmentFile=/home/sshalert/sshalert/secrets.env
Restart=always

```




