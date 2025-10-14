# 🎮 Instructions - Gestion du Serveur Minecraft

## 🚀 Démarrer le Serveur

### 1. Première fois (Configuration)
```bash
# Copier le fichier de configuration
copy env.example .env

# Éditer votre IP dans le fichier .env
notepad .env
# Modifier : SERVER_IP=YOUR_ADRESSE_IP (remplacer par votre adresse IP)
```

### 2. Démarrer le serveur
```bash
# Option 1: Script automatique
start-server.bat

# Option 2: Commandes manuelles
docker-compose build
docker-compose up -d
```

### 3. Vérifier que le serveur démarre
```bash
# Voir les logs en temps réel
docker-compose logs -f

# Voir l'état du serveur
docker-compose ps
```

## ⏹️ Arrêter le Serveur

### Arrêt normal (recommandé)
```bash
# Arrêter proprement le serveur
docker-compose down
```

### Arrêt d'urgence
```bash
# Arrêter immédiatement (si le serveur ne répond pas)
docker-compose kill
```

### Arrêt complet (supprime les données)
```bash
# ATTENTION: Supprime les mondes et sauvegardes !
docker-compose down -v
```

## 🔄 Redémarrer le Serveur

### Redémarrage simple
```bash
# Redémarrer le serveur
docker-compose restart
```

### Redémarrage complet
```bash
# Arrêter, reconstruire et redémarrer
docker-compose down
docker-compose build
docker-compose up -d
```

### Redémarrage avec nettoyage
```bash
# Redémarrage complet sans cache
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

## 📊 Monitoring du Serveur

### Voir les logs
```bash
# Logs en temps réel
docker-compose logs -f

# Derniers logs
docker-compose logs --tail=50

# Logs d'erreur uniquement
docker-compose logs | findstr "ERROR"
```

### État du serveur
```bash
# Voir l'état des conteneurs
docker-compose ps

# Statistiques du serveur
docker stats prominence-minecraft-server

# Vérifier que le port est ouvert
netstat -an | findstr :[YOUR_PORT]
```

## 🔧 Maintenance

### Sauvegarder le monde
```bash
# Sauvegarde manuelle
docker exec prominence-minecraft-server tar -czf /minecraft/backups/world-$(date +%Y%m%d).tar.gz /minecraft/world
```

### Accéder au serveur
```bash
# Entrer dans le conteneur
docker exec -it prominence-minecraft-server bash

# Copier des fichiers depuis le serveur
docker cp prominence-minecraft-server:/minecraft/world ./backup-world
```

### Nettoyer les ressources
```bash
# Nettoyer les images inutilisées
docker system prune -a

# Voir l'espace utilisé
docker system df
```

## 🌐 Connexion au Serveur

### Depuis le même PC
- **Adresse** : `localhost:YOUR_PORT`

### Depuis un autre PC
- **Adresse** : `VOTRE_IP:YOUR_PORT`
- **Trouver votre IP** : `ipconfig | findstr "IPv4"`

## ⚙️ Configuration

### Modifier la RAM
```bash
# Éditer le fichier .env
notepad .env
# Modifier : JAVA_ARGS=-Xmx4G -Xms4G
# Redémarrer le serveur
docker-compose restart
```

### Changer le port
```bash
# Éditer le fichier .env
notepad .env
# Modifier : SERVER_PORT=YOUR_PORT
# Redémarrer le serveur
docker-compose restart
```

### Modifier les paramètres du serveur
```bash
# Éditer server.properties
notepad server.properties
# Modifier : max-players=10, gamemode=survival, etc.
# Redémarrer le serveur
docker-compose restart
```

## 🆘 Dépannage

### Le serveur ne démarre pas
```bash
# Vérifier les logs d'erreur
docker-compose logs --tail=50

# Vérifier l'état
docker-compose ps

# Vérifier Docker
docker info
```

### Problèmes de connexion
```bash
# Vérifier le port
netstat -an | findstr :YOUR_PORT

# Tester la connexion
Test-NetConnection -ComputerName localhost -Port YOUR_PORT

# Vérifier le pare-feu
netsh advfirewall firewall show rule name="Minecraft Server"
```

### Problèmes de performance
```bash
# Vérifier les ressources
docker stats prominence-minecraft-server

# Voir les logs de performance
docker-compose logs | findstr "Can't keep up"
```

## 📝 Commandes Rapides

### Démarrage rapide
```bash
start-server.bat
```

### Arrêt rapide
```bash
docker-compose down
```

### Redémarrage rapide
```bash
docker-compose restart
```

### Logs rapides
```bash
docker-compose logs -f
```

## 🎯 Workflow Typique

### 1. Démarrage quotidien
```bash
docker-compose up -d
docker-compose logs -f
```

### 2. Arrêt quotidien
```bash
docker-compose down
```

### 3. Maintenance hebdomadaire
```bash
docker-compose down
docker-compose build
docker-compose up -d
```

### 4. Sauvegarde mensuelle
```bash
docker exec prominence-minecraft-server tar -czf /minecraft/backups/world-$(date +%Y%m%d).tar.gz /minecraft/world
```

## 🎉 Prêt à Jouer !

Votre serveur Minecraft Prominence II est maintenant configuré et prêt à l'emploi !

**Commandes essentielles à retenir :**
- **Démarrer** : `docker-compose up -d`
- **Arrêter** : `docker-compose down`
- **Redémarrer** : `docker-compose restart`
- **Logs** : `docker-compose logs -f`

---

*Développé avec ❤️ pour une expérience Minecraft optimale*
