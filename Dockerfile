FROM ghcr.io/azuracast/azuracast:latest

# Instalar tini explicitamente para que Fly.io pueda arrancar el proceso
# AzuraCast usa: tini -- /usr/local/bin/my_init --no-main-command
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends tini && \
    rm -rf /var/lib/apt/lists/*

# Verificar que my_init existe
RUN test -f /usr/local/bin/my_init || (echo 'ERROR: my_init not found' && exit 1)

EXPOSE 80 443 8000 8443 2022

VOLUME ["/var/azuracast"]

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/local/bin/my_init", "--no-main-command"]
