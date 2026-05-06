FROM ghcr.io/azuracast/azuracast:latest

# Sobrescribir el ENTRYPOINT original de AzuraCast para que Fly.io
# no duplique ni prefije tini al comando
ENTRYPOINT []
CMD ["/usr/local/bin/my_init", "--no-main-command"]

EXPOSE 80 443 8000 8443 2022
VOLUME ["/var/azuracast"]
