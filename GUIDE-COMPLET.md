# 🎮 Guide Complet - Serveur Minecraft Prominence II

### *Hasturian Era - Documentation Complète*

---

## 🎯 Prérequis

### 🛠️ **Outils Requis**

- **Docker Desktop** - [Télécharger ici](https://www.docker.com/products/docker-desktop/)
- **CursForge** - [Télécharger ici](https://www.curseforge.com/download/app)
- **4GB de RAM** minimum
- **10GB d'espace disque** libre

### 🎮 **Modpack Prominence II**

- **CursForge** - [Télécharger CursForge](https://www.curseforge.com/download/app)
- **ModPack Prominence II** - [Télécharger le ModPack Prominence II](https://www.curseforge.com/minecraft/modpacks/prominence-2-rpg)

---

## ⚙️ Configuration Initiale

### ℹ️ Première fois (Configuration initiale)

> **⚠️ Important** : Cette étape n'est nécessaire qu'une seule fois lors de la première installation.

```bash
# 📋 Étape 1 : Copier les fichiers de configuration depuis les templates
copy .env.example .env
copy server.properties.template server.properties
copy Dockerfile.template Dockerfile
copy docker-compose-template.yml docker-compose.yml
```

### 🌐 Trouver/Choisir votre ADRESSE_IP et le PORT de votre ordinateur

1. Pour **TROUVER** votre `ADRESSE_IP`, utilisez la commande `ipconfig` dans **PowerShell autant qu'admin**.
2. Pour **CHOISIR** votre `PORT`, selectionner *(dans votre tête)* un nombre entre `00000` et `99999` que vous **utiliser** *(et qui est libre de préférence)* à chaque fois pour les fichiers `docker, env, server.ptoperties`, etc.

---

## ⚙️ Configuration des Fichiers

### Configuration du fichier `.env`

```bash
SERVER_IP=VOTRE_IP                  # Votre IP locale
SERVER_PORT=12345                   # Port du serveur (exemple)
JAVA_ARGS=-Xmx4G -Xms4G             # RAM (minimum 4Go)
TOKEN_NGROK=YOUR_TOKEN_NGROK        # Token ngrok pour connexion distante
```

### Configuration du fichier `server.properties`

```bash
# Server Configuration
server-name=Prominence II Server    # Nom du serveur (exemple)
server-port=12345                   # Port du serveur (exemple)
server-ip=VOTRE_ADRESS_IP           # Adresse IP du PC, voir les commandes plus bas

# Query
enable-query=false
query.port=12345                   # Port du serveur (exemple)
```

>*💡 Astuce : Pour trouver votre adresse IP, utilisez la commande `ipconfig` dans PowerShell.*

---

```bash
# Ouvrir et modifier le fichier .env
notepad .env
```
### 🔧 À modifier : 
- SERVER_IP=YOUR_ADRESSE_IP (remplacer YOUR_ADRESSE_IP par votre adresse IP réelle)
- SERVER_PORT=YOUR_PORT (remplacer YOUR_PORT par votre PORT réelle)
- TOKEN_NGROK=YOUR_TOKEN_NGROK (remplacer YOUR_TOKEN_NGROK par votre TOKEN_NGROK réelle)

```bash
# Ouvrir et modifier server.properties
notepad server.properties
```
### 🔧 À modifier : 
- server-ip=YOUR_ADRESSE_IP (remplacer YOUR_ADRESSE_IP par votre adresse IP réelle)
- query.port=12345 (remplacer "12345" par votre PORT réelle)

```bash
# Ouvrir et modifier Dockerfile
notepad Dockerfile
```
### 🔧 À modifier : 
- ENV SERVER_IP=YOUR_ADRESSE_IP (remplacer par votre adresse IP réelle)
- EXPOSE 12345 (remplacer "12345" par votre PORT réelle)

```bash
# Ouvrir et modifier docker-compose.yml
notepad docker-compose.yml
```
### 🔧 À modifier :
- ${SERVER_PORT:-YOUR_VALUE}:YOUR_VALUE (remplacer les deux YOUR_VALUE par votre PORT réelle)


>*💡 Astuce : Pour trouver votre adresse IP, utilisez la commande `ipconfig` dans PowerShell.*

---

## 🚀 Démarrage du Serveur

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

### 3. Vérification

> **✅ Vérifications essentielles après le démarrage**

```bash
# 📊 Voir les logs en temps réel (pour surveiller le démarrage)
docker-compose logs -f

# 📈 Vérifier l'état du serveur (doit afficher "Up" et "healthy")
docker-compose ps

# 🔍 Vérifier que le port est bien ouvert en remplaçant YOUR_PORT par votre PORT réelle
netstat -an | findstr :YOUR_PORT
```

--



## 🌐 Connexion au Serveur

### 🏠 Depuis le même PC

> **💻 Connexion locale** : Jouer sur la même machine (en remplaçant YOUR_PORT par votre PORT réelle et YOUR_ADRESSE_IP par votre ADRESSE_IP réelle)

- **Adresse** : `localhost:YOUR_PORT`
- **Alternative** : `YOUR_ADRESSE_IP:YOUR_PORT`

> **💡 Astuce** : Assurez-vous que le PARE-FEU autorise les connexions sur votre PORT.

---

## 🌐 Solution ngrok (Recommandée)

### **Avantages :**
- ✅ **Simple** : Via connexion sur site Web puis un clique
- ✅ **Sécurisé** : Tunnel chiffré
- ✅ **Gratuit** : Version gratuite disponible
- ✅ **Rapide** : Configuration en 30 secondes

### **Comment utiliser :**

#### **1. Configurer le Token**
- Récuperer votre token via leur site web : [ici](https://dashboard.ngrok.com/get-started/your-authtoken) 
- Puis le mettre dans la valeur **TOKEN_NGROK** du fichier [**.env**](.env)
```javascript
TOKEN_NGROK=YOUR_TOKEN_NGROK
```

#### **2. Démarrer le tunnel**
```bash
# Option 1: Script automatique
start-ngrok.bat

# Option 2: Commande manuelle
ngrok tcp 12345
```

#### **3. Récupérer l'adresse**
`ngrok` affichera une adresse comme :
```
tcp://0.tcp.ngrok.io:12345 -> localhost:12345
```

#### **4. Partager l'adresse**
Donnez à votre ami l'adresse : `0.tcp.ngrok.io:12345`

### **⚠️ Important :**
- **Port** : Utilisez le port affiché par `ngrok` (ex: `12345`)
- **Adresse** : Utilisez l'adresse `ngrok` (ex: `0.tcp.ngrok.io`)
- **Tunnel actif** : Le `tunnel` doit **rester ouvert** pendant que vous jouez

---

## 🔧 Port Forwarding (Avancée)

### **Configuration routeur :**

#### **1. Accéder au routeur**
- **Adresse** : `http://198.148.1.1` (exemple)
- **Identifiants** : `admin` / `admin` (ou vérifiez l'étiquette du routeur)

#### **2. Configuration IP statique (OBLIGATOIRE)**
- Allez dans **"Réseau"** → **"DHCP"**
- Cherchez **"Réservation d'adresse"** ou **"Adresses fixes"**
- Ajoutez votre PC :
  ```
  Adresse MAC : [MAC de votre PC]
  Adresse IP : 198.148.1.1
  Nom : PC-Minecraft-Server
  ```

#### **3. Configuration Port Forwarding**
- Allez dans **"Réseau"** → **"NAT/PAT"** ou **"Règles de trafic"**
- Cliquez sur **"Créer une règle NAT/PAT"**
- Remplissez le formulaire :
  ```
  ✅ Activer : Oui
  ✅ Application/Service : Minecraft Server
  ✅ Port interne : 12345
  ✅ Port externe : 12345
  ✅ Protocole : TCP
  ✅ Équipement : [Votre PC - 198.148.1.11]
  ✅ IP externe : 0.0.0.0/0 (ou vide)
  ```
- Votre routeur peux vous **demander d'appuyer** sur le bouton `WPS` du routeur (de la Box).
- Sauvegardez et redémarrez le routeur si demandé

### **Configuration pour autres routeurs :**

#### **Routeurs génériques :**
1. **Accédez à votre routeur** : `198.148.1.1` ou `198.148.0.1`
2. **Port Forwarding** : Redirigez le port `12345` vers votre PC
3. **IP statique** : Configurez une `Adresse IP fixe` pour votre PC
4. **Adresse publique** : Utilisez votre `Adresse IP publique`

### **⚠️ Risques :**
- 🔒 **Sécurité** : Exposition directe à Internet
- 🚫 **ISP** : Certains FAI bloquent les serveurs
- 🔧 **Complexe** : Configuration technique requise

---

## 🎮 Instructions pour votre ami

### **Configuration Minecraft :**
1. **Version** : Minecraft `1.20.1`
2. **Modpack** : Prominence II: Hasturian Era `v3.9.1`
3. **Adresse** : 
   - **Avec ngrok** : `0.tcp.ngrok.io:12345` (exemple)
   - **Avec Port Forwarding** : `Votre IP et votre port [IP:PORT]`
4. **Port** : 
   - **Avec ngrok** : Utiliser le port affiché par `ngrok`
   - **Avec Port Forwarding** : `[PORT]`

### **Test de connexion :**
```bash
# Avec ngrok
telnet 0.tcp.ngrok.io: YOUR_PORT
```

---

## 📊 Comparaison des solutions

| Solution | Simplicité | Sécurité | Coût | Performance |
|----------|------------|----------|------|-------------|
| **Ngrok** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | Gratuit | ⭐⭐⭐⭐ |
| **Port Forwarding** | ⭐⭐ | ⭐⭐ | Gratuit | ⭐⭐⭐⭐⭐ |

---

## 🚀 Démarrage rapide

### **Option A : Avec ngrok**
```bash
# 1. Démarrer votre serveur
docker-compose up -d

# 2. Démarrer le tunnel
start-ngrok.bat

# 3. Partager l'adresse ngrok
# 4. Votre ami se connecte avec l'adresse ngrok
```

### **Option B : Avec Port Forwarding**
```bash
# 1. Démarrer votre serveur
docker-compose up -d

# 2. Configurer le port forwarding sur votre routeur
# 3. Partager votre IP publique : ADRESSE_IP_PUB:12345
# 4. Votre ami se connecte avec votre IP publique
```

---

## ⚙️ Paramètres du Serveur

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

## 🎉 Prêt à Jouer !

> **🎮 Félicitations !** Votre serveur Minecraft Prominence II est maintenant configuré et prêt à l'emploi !

### 🎯 Commandes essentielles à retenir

| Action | Commande | Description |
|--------|----------|-------------|
| 🚀 **Démarrer** | `docker-compose up -d` | Lance le serveur en arrière-plan |
| ⏹️ **Arrêter** | `docker-compose down` | Arrête proprement le serveur |
| 🔄 **Redémarrage** | `docker-compose restart` | Redémarre rapidement le serveur |
| 📊 **Logs** | `docker-compose logs -f` | Suit l'activité en temps réel |
| 📈 **État** | `docker-compose ps` | Vérifie le statut du serveur |

### 🎮 Prochaines étapes

1. **Connectez-vous** avec l'adresse `localhost:25565`
2. **Invitez vos amis** avec votre IP publique
3. **Explorez** le monde Prominence II
4. **Profitez** de votre serveur !

---

## 📝 Notes Importantes

- ⚠️ **EULA** : En utilisant ce serveur, vous acceptez l'EULA de Mojang
- 🔒 **Sécurité** : Le serveur fonctionne en **local** uniquement
- 💾 **Sauvegardes** : Les données sont sauvegardées automatiquement
- 🚀 **Performance** : Ce modpack nécessite au moins `4GB` de **RAM**

### **Résumé des solutions :**
- **ngrok** : Simple et rapide, mais nécessite une carte de crédit pour les `tunnels TCP`
- **Port Forwarding** : **Plus complexe** mais **plus stable et performant**

---

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

### Problèmes Courants

1. **Port occupé** : Changez le port dans `.env`
2. **Pas assez de RAM** : Augmentez `JAVA_ARGS` dans `.env`
3. **Modpack incompatible** : Vérifiez la version Minecraft (1.20.1)

### Logs Importants
- Logs du serveur : `docker-compose logs minecraft-server`
- Logs Docker : `docker logs prominence-minecraft-server`

### **Problème : Connexion refusée**
- Vérifiez que le serveur Minecraft est démarré : `docker ps`
- **Avec ngrok** : Vérifiez que `ngrok` est actif
- **Avec Port Forwarding** : Vérifiez la règle `NAT/PAT` sur le routeur
- Vérifiez `l'adresse IP` et le `port`
- Vérifiez le `firewall Windows`

### **Problème : Latence élevée**
- `ngrok` gratuit a des **limitations de bande passante**
- Considérez un compte `ngrok` **payant** pour de **meilleures performances**

### **Problème : Tunnel fermé (ngrok)**
- Redémarrez `ngrok`
- L'adresse change à chaque redémarrage

### **Problème : Port Forwarding ne fonctionne pas**
- Vérifiez que l'`IP statique` est configurée
- Vérifiez que la règle `NAT/PAT` est active
- Redémarrez le routeur
- Vérifiez que votre `FAI` ne bloque pas le port `12345`
```

---

*Développé avec ❤️ pour une expérience Minecraft optimale*

> **💡 Besoin d'aide ?** Consultez les sections de dépannage ou les guides de configuration pour plus d'informations.
