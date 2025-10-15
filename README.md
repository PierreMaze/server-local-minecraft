<div align="center">

# 🎮 Serveur Minecraft Prominence II

### *Hasturian Era - Expérience RPG Complète*

[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Minecraft](https://img.shields.io/badge/Minecraft-1.20.1-62B47A?style=for-the-badge&logo=minecraft&logoColor=white)](https://minecraft.net/)
[![Fabric](https://img.shields.io/badge/Fabric-0.16.14-6272A4?style=for-the-badge&logo=fabric&logoColor=white)](https://fabricmc.net/)
[![Java](https://img.shields.io/badge/Java-17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://openjdk.org/)

---

## 🌟 **Déploiement Instantané avec Docker**

**Un serveur Minecraft en quelques clics !**

</div>

## 📊 Spécifications Techniques

- **Minecraft** : Version 1.20.1
- **Modloader** : Fabric 0.16.14
- **Java** : OpenJDK 17 (Eclipse Temurin)
- **RAM** : 4GB par défaut (configurable)
- **Port** : 12345 (configurable)
- **Docker** : Déploiement simple de contenaire
- **Sauvegardes automatiques** des mondes

## 🎮 Modpack Inclus

**Prominence II: Hasturian Era v3.9.1**
- [**355 Mods**](MODS-LIST.md) inclus pour une expérience complète
- **Expérience RPG** avec système de quêtes avancé
- **Nouveaux biomes** et dimensions uniques
- **Système de progression** et de personnalisation

## 🎯 **Pré-requis**


### 🎮 **Modpack Prominence II**

- **CursForge** - [Télécharger CursForge](https://www.curseforge.com/download/app)
- **ModPack Prominence II** - [Télécharger le ModPack Prominence II](https://www.curseforge.com/minecraft/modpacks/prominence-2-rpg)

### 🛠️ **Outils Serveur**

- **Docker** - [Télécharger Docker Desktop](https://www.docker.com/products/docker-desktop/)
- **Test Setup** - Executez depuis l'explorateur de fichier `test-setup.bat` pour vérifier que tout est correct.

## 📚 **Documentation**

| 📖 **Guide** | 📝 **Description** |
|-------------|-------------------|
| [**Guide Complet**](GUIDE-COMPLET.md) | 📚 **Installation et configuration** - Guide pas à pas de l'installation, configuration et démarrage du serveur |
| [**Guide Port Forwarding**](GUIDE-PORT-FORWARDING.md) | 🌐 **Connexion distante** - Configuration du routeur pour permettre la connexion depuis Internet |
| [**Guide Commandes Docker**](GUIDE-COMMANDES-DOCKER.md) | 🐳 **Commandes Docker** - Commandes avancées pour la gestion du serveur |
| [**Liste des Mods**](MODS-LIST.md) | 📋 **Mods inclus** - Liste complète des 355 mods du modpack Prominence II |

## 🚀 **Guide d'Installation Rapide**

### **📋 Prérequis**
1. **🖥️ Virtualisation** : Activez la virtualisation dans le BIOS/UEFI de votre ordinateur
2. **🐳 Docker** : Installez Docker Desktop depuis [docker.com](https://www.docker.com/products/docker-desktop/)

### **⚙️ Configuration des Fichiers**
3. **📁 Copiez et renommez** les fichiers templates :

   - [**server.properties.template**](server.properties.template) **→ server.properties**
   - [**.env.example**](.env.example) **→ .env**
   - [**Dockerfile.template**](Dockerfile.template) **→ Dockerfile**
   - [**docker-compose-template.yml**](docker-compose-template.yml) **→ docker-compose.yml**


4. **🔧 Configurez vos variables** dans chaque fichier :
   - **`server.properties`** : Nom, Adresse IP, Port et Query Port du serveur
   - **`.env`** :  Adresse IP, Port et RAM du serveur
   - **`Dockerfile`** : Port (via la variable ***"EXPOSE"**)
   - **`docker-compose.yml`** : Port (via la variable **port**: *"${SERVER_PORT:-**12345**}:**12345**"*)
   
   💡 **Astuce** : Vous pouvez demander à ChatGPT de générer ces configurations !

### **✅ Vérification et Démarrage**
5. **🧪 Test de configuration** : Executez depuis l'explorateur de fichier `test-setup.bat` pour vérifier que tout est correct 
6. **🎮 Démarrage du serveur** : Exécutez depuis l'explorateur de fichier `start-server.bat`.
7. **🌐 Connexion distante** : Pour jouer avec des amis en ligne, consultez le [**Guide Port Forwarding**](GUIDE-PORT-FORWARDING.md)


## 🎯 **Commandes Essentielles**

| Action | Commande | Description |
|--------|----------|-------------|
| ▶️ **Démarrer** | `docker-compose up -d` | Lance le serveur en arrière-plan |
| ⏹️ **Arrêter** | `docker-compose down` | Arrête proprement le serveur |
| 🔄 **Redémarrage** | `docker-compose restart` | Redémarre rapidement le serveur |
| 📊 **Logs** | `docker-compose logs -f` | Suit l'activité en temps réel |
| 📈 **État** | `docker-compose ps` | Vérifie le statut du serveur |
| 🧪 **Test** | `test-setup.bat` | Vérifie la configuration |
| 🚀 **Démarrage Auto** | `start-server.bat` | Démarre le serveur automatiquement |

## 🆘 **Dépannage**

### **🚫 Le serveur ne démarre pas**
```bash
# Vérifier les logs d'erreur
docker-compose logs --tail=50

# Vérifier l'état des conteneurs
docker-compose ps

# Reconstruire l'image
docker-compose build --no-cache
```

### **🌐 Problèmes de connexion**
```bash
# Vérifier que le port est ouvert
netstat -an | findstr :12345

# Tester la connexion locale
Test-NetConnection -ComputerName localhost -Port 12345

# Vérifier les règles du pare-feu
netsh advfirewall firewall show rule name="Minecraft Server"
```

### **⚡ Problèmes de performance**
```bash
# Vérifier l'utilisation des ressources
docker stats prominence-minecraft-server

# Voir les logs de performance
docker-compose logs | findstr "Can't keep up"

# Vérifier l'espace disque
docker system df
```

### **🛑 Problèmes Courants**
1. **Port occupé** : Changez le port dans `.env`
2. **Pas assez de RAM** : Augmentez `JAVA_ARGS` dans `.env`
3. **Modpack incompatible** : Vérifiez la version Minecraft (1.20.1)
4. **Virtualisation désactivée** : Activez-la dans le BIOS
5. **Docker non installé** : Installez Docker Desktop

## 🛡️ **Sécurité & Performance**

- ✅ **EULA accepté** automatiquement
- 🔒 **Serveur local** sécurisé
- 💾 **Sauvegardes** automatiques
- 🚀 **Performance** optimisée
- 🐳 **Docker** isolé et stable

## 🎉 **Prêt à Jouer !**

<div align="center">

### 🎮 **Votre aventure Prominence II vous attend !**

**Modpack RPG complet avec 355 mods pour une expérience unique**

---

*Développé avec ❤️ pour une expérience Minecraft optimale*

[![GitHub](https://img.shields.io/badge/GitHub-Repository-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com)
[![Docker](https://img.shields.io/badge/Docker-Hub-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://hub.docker.com)

</div>
