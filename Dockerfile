FROM ghcr.io/azuracast/azuracast:latest

EXPOSE 80 443 8000 8443 2022

VOLUME ["/var/azuracast"]
