FROM ghcr.io/azuracast/azuracast:latest

# Fly.io necesita `tini` para arrancar el proceso principal
# AzuraCast usa Debian/Ubuntu base, así que lo instalamos directamente
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends tini && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80 443 8000 8443 2022

VOLUME ["/var/azuracast"]

# tini ya estará disponible para que Fly.io lo use como wrapper
CMD ["/usr/local/bin/my_init", "--no-main-command"]
