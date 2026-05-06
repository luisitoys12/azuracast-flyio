FROM ghcr.io/azuracast/azuracast:latest

# Fly.io busca `tini` en el PATH para wrappear el proceso
# Lo instalamos en todos los paths posibles como shim
RUN printf '#!/bin/sh\nexec "$@"\n' > /usr/bin/tini \
 && printf '#!/bin/sh\nexec "$@"\n' > /usr/local/bin/tini \
 && printf '#!/bin/sh\nexec "$@"\n' > /sbin/tini \
 && chmod +x /usr/bin/tini /usr/local/bin/tini /sbin/tini

EXPOSE 80 443 8000 8443 2022
VOLUME ["/var/azuracast"]

# Limpiar ENTRYPOINT para que Fly.io controle el arranque directamente
# y no duplique /usr/local/bin/my_init
ENTRYPOINT []
CMD ["/usr/local/bin/my_init", "--no-main-command"]
