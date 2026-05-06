FROM ghcr.io/azuracast/azuracast:latest

# Instalar tini en la ruta exacta que Fly.io busca
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends tini && \
    ln -sf /usr/bin/tini /tini && \
    chmod +x /usr/bin/tini && \
    rm -rf /var/lib/apt/lists/*

# Verificar rutas criticas
RUN ls -la /usr/bin/tini && ls -la /usr/local/bin/my_init

EXPOSE 80 443 8000 8443 2022

VOLUME ["/var/azuracast"]

# Sobreescribir entrypoint completamente - no usar tini como wrapper
ENTRYPOINT []
CMD ["/usr/local/bin/my_init", "--no-main-command"]
