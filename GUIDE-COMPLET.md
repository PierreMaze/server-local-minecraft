# 🎮 Guide Complet - Serveur Minecraft Prominence II

### *Hasturian Era - Installation et Configuration*

---

## 🎯 Prérequis

### 1. 🖥️ **Activer la Virtualisation dans le BIOS**

> **⚠️ Important** : Cette étape est obligatoire pour Docker

**Pour activer la virtualisation :**
- **Redémarrez** votre ordinateur
- **Accédez au BIOS/UEFI** (généralement F2, F12, ou Suppr au démarrage)
- **Recherchez** les options de virtualisation :
  - **Intel** : Intel VT-x ou Intel Virtualization Technology
  - **AMD** : AMD-V ou SVM Mode
- **Activez** la virtualisation
- **Sauvegardez** et redémarrez

**Vérification :**
- Ouvrez le **Gestionnaire des tâches**
- Onglet **"Performances"** → **"CPU"**
- Vérifiez **"Virtualisation: Activée"**

### 2. 🐳 **Installer Docker**

- **Téléchargez** Docker Desktop : [docker.com](https://www.docker.com/products/docker-desktop/)
- **Installez** et **redémarrez** votre ordinateur
- **Lancez** Docker Desktop
- **Vérifiez** que Docker fonctionne : `docker --version`

---

## ⚙️ Configuration Initiale

### 3. 📁 **Copier les Fichiers de Configuration**

> **💡 Première fois uniquement** : Copiez les templates vers les fichiers de configuration

```bash
# Copier/coller cette commande pour dupliquer les fichiers de configuration depuis les templates
copy .env.example .env
copy server.properties.template server.properties
copy Dockerfile.template Dockerfile
copy docker-compose-template.yml docker-compose.yml
```

### 4. 🌐 **Trouver l'Adresse IP et Choisir un PORT**

**Trouver votre adresse IP :**
```bash
# Dans PowerShell (en tant qu'administrateur)
ipconfig
```
- Cherchez **"Adresse IPv4"** (ex: `192.168.1.100`)

**Choisir un PORT :**
- Sélectionnez un nombre entre `10000` et `65535`
- Exemple : `12345`, `25565`, `30000`

---

## 🔧 Configuration des Fichiers

### 5. ⚙️ **Configurer les Fichiers**

#### **Fichier `.env`**
```bash
SERVER_IP=192.168.1.100           # Votre IP locale
SERVER_PORT=12345                 # Port choisi
JAVA_ARGS=-Xmx4G -Xms4G           # RAM (minimum 4Go)
```

#### **Fichier `server.properties`**
```bash
server-name=Prominence II Server  # Nom du serveur
server-port=12345                 # Port choisi
server-ip=192.168.1.100           # Votre IP locale

[...]
           
enable-query=false
query.port=12345                  # Port choisi
```

#### **Fichier `Dockerfile`**
```bash
# Remplacer le port dans la ligne EXPOSE
EXPOSE 12345                      # Port choisi
```

#### **Fichier `docker-compose.yml`**
```bash
ports:
  - "${SERVER_PORT:-12345}:12345"  # Remplacer les deux ports par votre port choisi
```

---

## ✅ Vérification et Démarrage

### 6. 🧪 **Vérification de la Configuration**

> **Test automatique** : Vérifiez que tout est correct

```bash
# Double-cliquez sur le fichier de test dans l'explorateur de fichier
test-setup.bat
```

**Le script vérifie :**
- ✅ Virtualisation activée
- ✅ Docker installé
- ✅ Fichiers de configuration présents
- ✅ Modpack téléchargé
- ✅ Espace disque suffisant

### 7. 🚀 **Démarrage du Serveur**

#### **Méthode Automatique (Recommandée)**
```bash
# Double-cliquez sur le fichier de démarrage dans l'explorateur de fichier
start-server.bat
```

#### **Méthode Manuelle (Si le script ne fonctionne pas)**
```bash
# Construire l'image Docker
docker-compose build

# Démarrer le serveur
docker-compose up -d

# Vérifier le statut
docker-compose ps
```

---

## 🌐 Connexion au Serveur

### 8. 🏠 **Connexion depuis le Même PC**

> **💻 Connexion locale** : Jouer sur la même machine

**Dans Minecraft :**
- **Adresse** : `localhost:12345` (remplacez par votre port)
- **Alternative** : `192.168.1.100:12345` (remplacez par votre IP et port)

**Vérifications :**
- ✅ Le serveur est démarré : `docker-compose ps`
- ✅ Le port est ouvert : `netstat -an | findstr :12345`
- ✅ Le pare-feu autorise les connexions

### 9. 🌍 **Connexion depuis un Autre PC**

> **🔗 Connexion distante** : Jouer avec des amis

**Pour permettre la connexion depuis l'extérieur :**
- Consultez le guide détaillé : [**Guide Port Forwarding**](GUIDE-PORT-FORWARDING.md)
- Ce guide explique la configuration du routeur et les options de connexion distante

**Informations pour vos amis :**
- **Version Minecraft** : `1.20.1`
- **Modpack** : Prominence II: Hasturian Era `v3.9.1`
- **Adresse** : `VOTRE_IP_PUBLIC:PORT` (ex: `98.148.1.1:12345`)

---

## 📝 Notes Importantes

- ⚠️ **EULA** : En utilisant ce serveur, vous acceptez l'EULA de Mojang
- 🔒 **Sécurité** : Le serveur fonctionne en **local** par défaut
- 💾 **Sauvegardes** : Les données sont sauvegardées automatiquement
- 🚀 **Performance** : Ce modpack nécessite au moins `4GB` de **RAM**

---

*Guide développé avec ❤️ pour une expérience Minecraft optimale*