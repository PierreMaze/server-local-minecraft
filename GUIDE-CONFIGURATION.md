# 🎮 Guide de Configuration - Serveur Minecraft Prominence II

Serveur Minecraft avec le modpack **Prominence II: Hasturian Era** déployé avec Docker.

## 📋 Prérequis

- **Docker Desktop** - [Télécharger ici](https://www.docker.com/products/docker-desktop/)
- **CursForge** - [Télécharger ici](https://www.curseforge.com/download/app)
- **4GB de RAM** minimum
- **10GB d'espace disque** libre

## ⚙️ Configuration

### 1. Créer le fichier de configuration
```bash
copy env.example .env
```

```bash
copy server.properties.template server.properties
```

### 2. Configurer les paramètres
Éditez le fichier `.env` :
```bash
SERVER_IP=VOTRE_IP                  # Votre IP locale
SERVER_PORT=12345                   # Port du serveur (exemple)
JAVA_ARGS=-Xmx4G -Xms4G             # RAM (minimum 4Go)
```

Éditez le fichier `server.properties` :
```bash
# Server Configuration
server-name=Prominence II Server    # Nom du serveur (exemple)
server-port=12345                   # Port du serveur (exemple)
server-ip=VOTRE_ADRESS_IP           # Adresse IP local

# Query
enable-query=false
query.port=12345                   # Port du serveur (exemple)
```

## 🔧 Dépannage

### Le serveur ne démarre pas
1. **Docker Desktop non démarré** : Lancez **Docker Desktop**
2. **Port occupé** : Changez le port dans `.env`
3. **Pas assez de RAM** : Augmentez `JAVA_ARGS` dans `.env`

### Problèmes de connexion
1. **Firewall bloqué** : Désactivez temporairement le **pare-feu**
2. **Modpack différent** : `Installez` et `lancer` le même modpack depuis **CursForge** - [Télécharger ici](https://www.curseforge.com/download/app)
3. **Version Minecraft** : Utilisez la version `1.20.1`

## 📝 Notes Importantes

- ⚠️ **EULA** : En utilisant ce serveur, vous acceptez l'EULA de Mojang
- 🔒 **Sécurité** : Le serveur fonctionne en **local** uniquement
- 💾 **Sauvegardes** : Les données sont sauvegardées automatiquement
- 🚀 **Performance** : Ce modpack nécessite au moins `4GB` de **RAM**

---

*Développé avec ❤️ pour une expérience Minecraft optimale*