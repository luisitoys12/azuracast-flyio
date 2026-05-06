FROM ghcr.io/azuracast/azuracast:latest

# Exponer todos los puertos necesarios para AzuraCast
EXPOSE 80 443 8000 8443 2022

# Volumen persistente para configuracion, musica y base de datos
VOLUME ["/var/azuracast"]

# AzuraCast maneja su propio arranque via supervisord internamente
