# Dockerfile pour serveur Minecraft avec modpack Prominence II: Hasturian Era
FROM eclipse-temurin:21-jdk

# Métadonnées
LABEL maintainer="MinecraftServer Docker Kira/Neko"
LABEL description="Serveur Minecraft avec modpack Prominence II: Hasturian Era"
LABEL version="1.0"

# Variables d'environnement
ENV MINECRAFT_VERSION=1.20.1
ENV MODLOADER=Fabric
ENV MODLOADER_VERSION=0.16.14
ENV RECOMMENDED_JAVA_VERSION=17
ENV JAVA_ARGS="-Xmx8G -Xms8G"
ENV ADDITIONAL_ARGS=""
ENV RESTART=false
ENV WAIT_FOR_USER_INPUT=false
ENV SKIP_JAVA_CHECK=false
ENV USE_SSJ=true
ENV SERVERSTARTERJAR_FORCE_FETCH=false
ENV SERVERSTARTERJAR_VERSION=latest
ENV EULA=true

# Installation des dépendances système
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Création de l'utilisateur minecraft (sécurité)
RUN groupadd -r minecraft && useradd -r -g minecraft minecraft

# Répertoire de travail
WORKDIR /minecraft

# Copie des fichiers du serveur
COPY Prominence_II_Hasturian_Era_v3.9.1_Server_Pack/ ./

# Rendre les scripts exécutables
RUN chmod +x start.sh install_java.sh

# Création du fichier EULA
RUN echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://aka.ms/MinecraftEULA)." > eula.txt && \
    echo "eula=true" >> eula.txt

# Création du répertoire pour les données du serveur
RUN mkdir -p /minecraft/world /minecraft/logs /minecraft/backups

# Changement de propriétaire pour l'utilisateur minecraft
RUN chown -R minecraft:minecraft /minecraft

# Utilisateur non-root
USER minecraft

# Exposition du port
EXPOSE 25565

# Volume pour la persistance des données
VOLUME ["/minecraft/world", "/minecraft/logs", "/minecraft/backups"]

# Modifier les variables pour utiliser Java directement
RUN sed -i 's/JAVA="java"/JAVA="\/opt\/java\/openjdk\/bin\/java"/' variables.txt && \
    sed -i 's/SKIP_JAVA_CHECK=false/SKIP_JAVA_CHECK=true/' variables.txt

# Commande de démarrage
CMD ["./start.sh"]
