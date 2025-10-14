# 🐳 Commandes Docker

Petit memo des commandes docker

## ⏹️ Arrêter le Serveur

### 🛑 Arrêt normal (recommandé)

> **✅ Méthode sécurisée** : Sauvegarde automatique avant arrêt

```bash
# Arrêter proprement le serveur (sauvegarde automatique)
docker-compose down
```

### 🚨 Arrêt d'urgence

> **⚠️ Utiliser uniquement si le serveur ne répond plus**

```bash
# Arrêter immédiatement (force l'arrêt sans sauvegarde)
docker-compose kill
```

### 💥 Arrêt complet (supprime les données)

> **🔥 DANGER** : Cette commande supprime définitivement tous les mondes et sauvegardes !

```bash
# ATTENTION: Supprime les mondes et sauvegardes !
# Utiliser uniquement pour une réinstallation complète
docker-compose down -v
```

## 🔄 Redémarrer le Serveur

### 🔄 Redémarrage simple

> **⚡ Rapide** : Conserve la configuration actuelle

```bash
# Redémarrer le serveur sans reconstruire l'image
docker-compose restart
```

### 🔧 Redémarrage complet

> **🔄 Standard** : Reconstruit l'image avec les dernières modifications

```bash
# Arrêter, reconstruire et redémarrer
docker-compose down
docker-compose build
docker-compose up -d
```

### 🧹 Redémarrage avec nettoyage

> **💨 Complet** : Force la reconstruction sans utiliser le cache

```bash
# Redémarrage complet sans cache (plus long mais plus propre)
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

---

## 📊 Monitoring

### 📋 Voir les logs

> **👀 Surveillance en temps réel** : Surveillez l'activité de votre serveur

```bash
# 📊 Logs en temps réel (suivi continu)
docker-compose logs -f

# 📄 Derniers logs (50 dernières lignes)
docker-compose logs --tail=50

# 🚨 Logs d'erreur uniquement (dépannage)
docker-compose logs | findstr "ERROR"

# 🔍 Rechercher un terme spécifique dans les logs
docker-compose logs | findstr "Player"
```

### 📈 État du serveur

> **📊 Informations système** : Vérifiez les performances et l'état

```bash
# 📋 Voir l'état des conteneurs (Up/Down/Healthy)
docker-compose ps

# 📊 Statistiques du serveur (CPU, RAM, réseau)
docker stats prominence-minecraft-server

# 🔌 Vérifier que le port est ouvert et accessible en remplaçant en remplaçant YOUR_PORT par votre PORT réelle
netstat -an | findstr :YOUR_PORT

# 🌐 Tester la connectivité réseau en remplaçant YOUR_PORT par votre PORT réelle
Test-NetConnection -ComputerName localhost -Port YOUR_PORT
```

---

## 🔧 Maintenance

### 💾 Sauvegarder le monde

> **🛡️ Protection des données** : Sauvegardez régulièrement vos mondes

```bash
# 💾 Sauvegarde manuelle avec horodatage
docker exec prominence-minecraft-server tar -czf /minecraft/backups/world-$(date +%Y%m%d).tar.gz /minecraft/world

# 📁 Créer le dossier de sauvegarde si nécessaire
docker exec prominence-minecraft-server mkdir -p /minecraft/backups
```

### 🔧 Accéder au serveur

> **🖥️ Administration directe** : Accès au système de fichiers du serveur

```bash
# 🚪 Entrer dans le conteneur (accès shell)
docker exec -it prominence-minecraft-server bash

# 📂 Copier des fichiers depuis le serveur vers l'hôte
docker cp prominence-minecraft-server:/minecraft/world ./backup-world

# 📤 Copier des fichiers de l'hôte vers le serveur
docker cp ./mods/ prominence-minecraft-server:/minecraft/mods/
```

### 🧹 Nettoyer les ressources

> **💨 Optimisation** : Libérez de l'espace disque

```bash
# 🗑️ Nettoyer les images inutilisées (ATTENTION: supprime tout le cache)
docker system prune -a

# 📊 Voir l'espace utilisé par Docker
docker system df

# 🔍 Voir les images Docker
docker images

# 🗂️ Nettoyer uniquement les conteneurs arrêtés
docker container prune
```