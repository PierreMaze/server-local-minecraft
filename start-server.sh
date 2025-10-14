#!/bin/bash

echo "========================================"
echo "  Serveur Minecraft - Prominence II"
echo "========================================"
echo

# Vérifier si Docker est installé
if ! command -v docker &> /dev/null; then
    echo "ERREUR: Docker n'est pas installé"
    echo "Veuillez installer Docker depuis: https://docs.docker.com/get-docker/"
    exit 1
fi

# Vérifier si Docker Compose est disponible
if ! command -v docker-compose &> /dev/null; then
    echo "ERREUR: Docker Compose n'est pas disponible"
    echo "Veuillez installer Docker Compose"
    exit 1
fi

echo "Docker détecté avec succès!"
echo

# Construire l'image si nécessaire
echo "Construction de l'image Docker..."
docker-compose build

if [ $? -ne 0 ]; then
    echo "ERREUR: Échec de la construction de l'image Docker"
    exit 1
fi

echo
echo "Démarrage du serveur Minecraft..."
echo "Le serveur sera accessible sur localhost:25565"
echo
echo "Pour voir les logs en temps réel, ouvrez un autre terminal et exécutez:"
echo "docker-compose logs -f"
echo
echo "Pour arrêter le serveur, appuyez sur Ctrl+C"
echo

# Démarrer le serveur
docker-compose up

echo
echo "Serveur arrêté."
