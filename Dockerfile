FROM ghcr.io/azuracast/azuracast:latest

# Script wrapper que Fly.io ejecutará como entrypoint
RUN printf '#!/bin/sh\nexec /usr/local/bin/my_init --no-main-command\n' > /entrypoint.sh \
 && chmod +x /entrypoint.sh

EXPOSE 80 443 8000 8443 2022
VOLUME ["/var/azuracast"]

ENTRYPOINT ["/entrypoint.sh"]
CMD []
