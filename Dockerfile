# Dockerfile mantenido como referencia pero no se usa en el deploy
# El fly.toml apunta directamente a la imagen ghcr.io/azuracast/azuracast:latest
# usando [build] image = "..."

# Si necesitas customizar en el futuro, descomenta y ajusta:
# FROM ghcr.io/azuracast/azuracast:latest
# RUN apt-get update && apt-get install -y tini
# EXPOSE 80 443 8000 8443 2022
# VOLUME ["/var/azuracast"]
