FROM ghcr.io/azuracast/azuracast:latest

# Fly.io siempre ejecuta: tini -- /usr/local/bin/my_init --no-main-command
# Si tini no existe, crashea. Creamos un shim que simplemente ejecuta lo que le pasen.
RUN printf '#!/bin/sh\nexec "$@"\n' > /usr/bin/tini && chmod +x /usr/bin/tini

EXPOSE 80 443 8000 8443 2022

VOLUME ["/var/azuracast"]

CMD ["/usr/local/bin/my_init", "--no-main-command"]
