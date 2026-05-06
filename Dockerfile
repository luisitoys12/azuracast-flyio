FROM ghcr.io/azuracast/azuracast:latest

# Exponer todos los puertos necesarios para AzuraCast
EXPOSE 80 443 8000 8443 2022

# Volumen persistente para configuración, música y base de datos
VOLUME ["/var/azuracast"]

# AzuraCast usa su propio entrypoint con supervisord
# No se sobreescribe CMD para respetar el comportamiento nativo de la imagen
