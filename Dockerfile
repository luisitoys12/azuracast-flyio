FROM ghcr.io/azuracast/azuracast:latest

# Fly.io necesita `tini` en /usr/bin/tini
# Creamos un shim minimo que simplemente ejecuta lo que le pasen
# NO redefinimos CMD para no duplicar el entrypoint de la imagen base
RUN printf '#!/bin/sh\nexec "$@"\n' > /usr/bin/tini && chmod +x /usr/bin/tini

EXPOSE 80 443 8000 8443 2022
VOLUME ["/var/azuracast"]
