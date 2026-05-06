FROM ghcr.io/azuracast/azuracast:latest

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80 443 8000 8443 2022
VOLUME ["/var/azuracast"]

ENTRYPOINT ["/entrypoint.sh"]
CMD []
