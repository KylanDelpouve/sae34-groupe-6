FROM debian:trixie-slim

RUN apt-get update && apt-get install -y freeradius freeradius-utils freeradius-postgresql netcat-openbsd

# Copie de la configuration
COPY raddb/clients.conf /etc/freeradius/3.0/clients.conf
COPY raddb/users /etc/freeradius/3.0/mods-config/files/authorize

# Copie de la configuration SQL corrigée
COPY raddb/sql /etc/freeradius/3.0/mods-available/sql

# Activation du module SQL
RUN ln -s /etc/freeradius/3.0/mods-available/sql /etc/freeradius/3.0/mods-enabled/sql

# Activation SQL dans le site par défaut (authorize)
RUN sed -i '/authorize {/a \ \t sql' /etc/freeradius/3.0/sites-available/default

# On change le propriétaire en root:freerad (groupe par défaut sous Debian) et on restreint les droits
# 640 : Lecture/Écriture root, Lecture groupe freerad (pour que le démon puisse lire le secret), Rien pour les autres.
RUN chown -R root:freerad /etc/freeradius/3.0/ && \
    chmod 640 /etc/freeradius/3.0/clients.conf /etc/freeradius/3.0/mods-config/files/authorize /etc/freeradius/3.0/mods-available/sql

# On lance FreeRADIUS en mode debug
CMD ["freeradius", "-X"]