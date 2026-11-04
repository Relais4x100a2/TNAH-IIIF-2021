# Site statique servi par nginx sans privilèges (uid 101, port 8080).
FROM nginxinc/nginx-unprivileged:1.30.6-alpine

# Les corrections de fichiers se font en root, puis on revient à l'utilisateur sans privilèges.
USER root
COPY . /usr/share/nginx/html
# Un site en HTTPS bloque les ressources en http : on force https sur les domaines externes.
RUN sed -i \
      -e 's|http://free.iiifhosting.com|https://free.iiifhosting.com|g' \
      -e 's|http://sas.gdmrdigital.com|https://sas.gdmrdigital.com|g' \
      -e 's|http://iiif.io|https://iiif.io|g' \
      /usr/share/nginx/html/*.json
USER 101

EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD wget -q -O /dev/null http://127.0.0.1:8080/ || exit 1
