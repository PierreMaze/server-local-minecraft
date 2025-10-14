# 🎮 Instructions - Gestion du Serveur Minecraft

## 🚀 Démarrer le Serveur

### 1. Première fois (Configuration initiale)

> **⚠️ Important** : Cette étape n'est nécessaire qu'une seule fois lors de la première installation.

```bash
# 📋 Étape 1 : Copier les fichiers de configuration depuis les templates
copy .env.example .env
copy server.properties.template server.properties
copy Dockerfile.template Dockerfile
copy docker-compose-template.yml docker-compose.yml

# 🌐 Étape 2 : Configurer votre adresse IP dans tous les fichiers
# Ouvrir et modifier le fichier .env
notepad .env
# 🔧 À modifier : SERVER_IP=YOUR_ADRESSE_IP (remplacer par votre adresse IP réelle)

# Ouvrir et modifier server.properties
notepad server.properties
# 🔧 À modifier : server-ip=YOUR_ADRESSE_IP (remplacer par votre adresse IP réelle)

# Ouvrir et modifier Dockerfile
notepad Dockerfile
# 🔧 À modifier : ENV SERVER_IP=YOUR_ADRESSE_IP (remplacer par votre adresse IP réelle)

# Ouvrir et modifier docker-compose.yml
notepad docker-compose.yml
# 🔧 À modifier : SERVER_IP=YOUR_ADRESSE_IP (remplacer par votre adresse IP réelle)
```

> **💡 Astuce** : Pour trouver votre adresse IP, utilisez la commande `ipconfig` dans PowerShell.

### 2. Démarrer le serveur

> **🚀 Méthodes de démarrage disponibles**

```bash
# 🎯 Option 1 : Script automatique (recommandé pour les débutants)
start-server.bat

# 🔧 Option 2 : Commandes manuelles (pour plus de contrôle)
# Construire l'image Docker
docker-compose build

# Démarrer le serveur en arrière-plan
docker-compose up -d
```

### 3. Vérifier que le serveur démarre correctement

> **✅ Vérifications essentielles après le démarrage**

```bash
# 📊 Voir les logs en temps réel (pour surveiller le démarrage)
docker-compose logs -f

# 📈 Vérifier l'état du serveur (doit afficher "Up" et "healthy")
docker-compose ps

# 🔍 Vérifier que le port est bien ouvert 
netstat -an | findstr :YOUR_PORT
```

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

## 🌐 Connexion au Serveur

### 🏠 Depuis le même PC

> **💻 Connexion locale** : Jouer sur la même machine

- **Adresse** : `localhost:25565`
- **Alternative** : `127.0.0.1:25565`

### 🌍 Depuis un autre PC

> **🌐 Connexion réseau** : Jouer depuis d'autres appareils

- **Adresse** : `VOTRE_IP:25565`
- **Trouver votre IP** : `ipconfig | findstr "IPv4"`
- **Exemple** : `192.168.1.100:25565`

> **💡 Astuce** : Assurez-vous que le pare-feu autorise les connexions sur le port 25565.

## ⚙️ Configuration

### 🧠 Modifier la RAM

> **💾 Allocation mémoire** : Ajustez selon votre système

```bash
# 📝 Éditer le fichier .env
notepad .env

# 🔧 Modifier la ligne : JAVA_ARGS=-Xmx4G -Xms4G
# Exemples :
# -Xmx2G -Xms2G  (2 Go de RAM)
# -Xmx8G -Xms8G  (8 Go de RAM)

# 🔄 Redémarrer le serveur pour appliquer les changements
docker-compose restart
```

### 🔌 Changer le port

> **🌐 Port personnalisé** : Utilisez un port différent si nécessaire

```bash
# 📝 Éditer le fichier .env
notepad .env

# 🔧 Modifier : SERVER_PORT=25565 (remplacer par votre port)
# Exemples : 25566, 25567, 25568, etc.

# 🔄 Redémarrer le serveur pour appliquer les changements
docker-compose restart
```

### 🎮 Modifier les paramètres du serveur

> **⚙️ Configuration Minecraft** : Personnalisez l'expérience de jeu

```bash
# 📝 Éditer server.properties
notepad server.properties

# 🔧 Paramètres courants à modifier :
# max-players=10          (nombre maximum de joueurs)
# gamemode=survival       (mode de jeu par défaut)
# difficulty=normal       (difficulté)
# pvp=true               (combat entre joueurs)
# allow-flight=false      (vol autorisé)

# 🔄 Redémarrer le serveur pour appliquer les changements
docker-compose restart
```

## 🆘 Dépannage

### 🚫 Le serveur ne démarre pas

> **🔍 Diagnostic de démarrage** : Identifiez la cause du problème

```bash
# 📋 Vérifier les logs d'erreur (50 dernières lignes)
docker-compose logs --tail=50

# 📊 Vérifier l'état des conteneurs
docker-compose ps

# 🔧 Vérifier l'état de Docker
docker info

# 🏗️ Vérifier la construction de l'image
docker-compose build --no-cache
```

### 🌐 Problèmes de connexion

> **🔌 Diagnostic réseau** : Vérifiez la connectivité

```bash
# 🔍 Vérifier que le port est ouvert
netstat -an | findstr :25565

# 🧪 Tester la connexion locale
Test-NetConnection -ComputerName localhost -Port 25565

# 🔥 Vérifier les règles du pare-feu
netsh advfirewall firewall show rule name="Minecraft Server"

# 🌍 Tester la connexion depuis l'extérieur
Test-NetConnection -ComputerName VOTRE_IP -Port 25565
```

### ⚡ Problèmes de performance

> **📈 Diagnostic de performance** : Optimisez les performances

```bash
# 📊 Vérifier l'utilisation des ressources
docker stats prominence-minecraft-server

# 🐌 Voir les logs de performance (lag)
docker-compose logs | findstr "Can't keep up"

# 💾 Vérifier l'espace disque
docker system df

# 🔄 Redémarrer avec plus de RAM si nécessaire
# Modifier .env : JAVA_ARGS=-Xmx8G -Xms8G
```

## 📝 Commandes Rapides

> **⚡ Référence rapide** : Les commandes les plus utilisées

### 🚀 Démarrage rapide
```bash
# 🎯 Script automatique (recommandé)
start-server.bat

# 🔧 Commande manuelle
docker-compose up -d
```

### ⏹️ Arrêt rapide
```bash
# 🛑 Arrêt propre
docker-compose down
```

### 🔄 Redémarrage rapide
```bash
# ⚡ Redémarrage simple
docker-compose restart
```

### 📊 Logs rapides
```bash
# 👀 Suivi en temps réel
docker-compose logs -f
```

## 🎯 Workflow Typique

> **📅 Routines recommandées** : Organisez votre gestion du serveur

### 🌅 1. Démarrage quotidien
```bash
# 🚀 Démarrer le serveur
docker-compose up -d

# 👀 Vérifier que tout fonctionne
docker-compose logs -f
```

### 🌙 2. Arrêt quotidien
```bash
# 🛑 Arrêter proprement le serveur
docker-compose down
```

### 🔧 3. Maintenance hebdomadaire
```bash
# 🔄 Redémarrage complet avec reconstruction
docker-compose down
docker-compose build
docker-compose up -d
```

### 💾 4. Sauvegarde mensuelle
```bash
# 🗂️ Créer une sauvegarde complète du monde
docker exec prominence-minecraft-server tar -czf /minecraft/backups/world-$(date +%Y%m%d).tar.gz /minecraft/world

# 📊 Vérifier l'espace disque
docker system df
```

## 🎉 Prêt à Jouer !

> **🎮 Félicitations !** Votre serveur Minecraft Prominence II est maintenant configuré et prêt à l'emploi !

### 🎯 Commandes essentielles à retenir

| Action | Commande | Description |
|--------|----------|-------------|
| 🚀 **Démarrer** | `docker-compose up -d` | Lance le serveur en arrière-plan |
| ⏹️ **Arrêter** | `docker-compose down` | Arrête proprement le serveur |
| 🔄 **Redémarrer** | `docker-compose restart` | Redémarre rapidement le serveur |
| 📊 **Logs** | `docker-compose logs -f` | Suit l'activité en temps réel |
| 📈 **État** | `docker-compose ps` | Vérifie le statut du serveur |

### 🎮 Prochaines étapes

1. **Connectez-vous** avec l'adresse `localhost:25565`
2. **Invitez vos amis** avec votre IP publique
3. **Explorez** le monde Prominence II
4. **Profitez** de votre serveur !

---

*Développé avec ❤️ pour une expérience Minecraft optimale*

> **💡 Besoin d'aide ?** Consultez les sections de dépannage ou les guides de configuration pour plus d'informations.
