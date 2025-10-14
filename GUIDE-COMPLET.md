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
<br><br><br>
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
<br><br><br>
## ⚙️ Configuration des Fichiers

>*💡 Astuce : Pour trouver votre adresse IP, utilisez la commande `ipconfig` dans PowerShell.*

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
query.port=12345                        # Port du serveur (exemple)
```

### Configuration du fichier `Dockerfile`

```bash
# Docker Configuration

# Exposition du port
EXPOSE 12345                            # remplacer "12345" par votre PORT choisi
```

### Configuration du fichier `docker-compose.yml`

```bash
    ports:
      - "${SERVER_PORT:-12345}:12345"  # remplacer les deux "12345" par votre PORT choisi        

    environment:   
    // [...]            
```

---
<br><br><br>
## 🚀 Démarrage du Serveur

### Démarrer le serveur

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

# 🔍 Vérifier que le port est bien ouvert en remplaçant YOUR_PORT par votre PORT choisi
netstat -an | findstr :YOUR_PORT
```

---

<br><br><br>
# 🌐 Connexion au Serveur
<br>

## 🏠 Depuis le même PC

> **💻 Connexion locale** : Jouer sur la même machine (en remplaçant YOUR_PORT par votre PORT choisi et YOUR_ADRESSE_IP par votre ADRESSE_IP réelle)

- **Adresse** : `localhost:YOUR_PORT`           // ex: localhost:12345
- **Alternative** : `YOUR_ADRESSE_IP:YOUR_PORT` // ex: 192.456.1.11:12345

> **💡 Astuce** : Assurez-vous que le PARE-FEU autorise les connexions sur votre PORT.

---

<br>

## 🌐 Depuis un autre PC

### 🔧 Port Forwarding (Avancée)

#### **1. Accéder au routeur**
- **Adresse** : `http://192.148.1.1` ou `http://192.148.0.1`   (exemple, consulter votre routeur)
- **Identifiants** : `admin` / `admin` (ou vérifiez l'étiquette du routeur)

#### **2. Configuration IP statique (OBLIGATOIRE)**
- Allez dans **"Réseau"** → **"DHCP"**
- Cherchez **"Réservation d'adresse"** ou **"Adresses fixes"**
- Ajoutez votre PC :
  ```
  Adresse MAC : [MAC de votre PC]
  Adresse IP : 198.148.1.1             (exemple, consulter votre routeur)
  Nom : PC-Minecraft-Server
  ```

#### **3. Configuration Port Forwarding**
- Allez dans **"Réseau"** → **"NAT/PAT"** ou **"Règles de trafic"**
- Cliquez sur **"Créer une règle NAT/PAT"**
- Remplissez le formulaire :
  ```
  ✅ Activer : Oui
  ✅ Application/Service : Minecraft Server
  ✅ Port interne : 12345  (exemple, mettre le port choisi)
  ✅ Port externe : 12345  (exemple, mettre le port choisi)
  ✅ Protocole : TCP
  ✅ Équipement : [Votre PC - 98.148.1.1]  (exemple, consulter votre routeur ou PC)
  ✅ IP externe : 0.0.0.0/0 (ou vide)
  ```
- Votre routeur peux vous **demander d'appuyer** sur le bouton `WPS` du routeur (de la Box).
- Sauvegardez et redémarrez le routeur si demandé


### **⚠️ Risques :**
- 🔒 **Sécurité** : Exposition directe à Internet
- 🚫 **ISP** : Certains FAI bloquent les serveurs
- 🔧 **Complexe** : Configuration technique requise

---

<br>

## 🎮 Instructions pour votre ami

### **Configuration Minecraft :**
1. **Version** : Minecraft `1.20.1`
2. **Modpack** : Prominence II: Hasturian Era `v3.9.1`
3. **IP/Port Forwarding** : `Votre IP_PUBLIC et votre PORT [IP_PUBLIC:PORT]`
      - **Ce qui donnera quelque chose comme** : `98.148.1.1:12345`

---
<br><br><br>
## 🎯 Commandes essentielles à retenir

| Action | Commande | Description |
|--------|----------|-------------|
| ▶️ **Démarrer** | `docker-compose up -d` | Lance le serveur en arrière-plan |
| ⏹️ **Arrêter** | `docker-compose down` | Arrête proprement le serveur |
| 🔄 **Redémarrage** | `docker-compose restart` | Redémarre rapidement le serveur |
| 📊 **Logs** | `docker-compose logs -f` | Suit l'activité en temps réel |
| 📈 **État** | `docker-compose ps` | Vérifie le statut du serveur |

---

<br><br><br>

# 🆘 Dépannage
<br>

## 🚫 Le serveur ne démarre pas

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


## 🌐 Problèmes de connexion

> **🔌 Diagnostic réseau** : Vérifiez la connectivité

```bash
# 🔍 Vérifier que le port est ouvert
netstat -an | findstr :12345

# 🧪 Tester la connexion locale
Test-NetConnection -ComputerName localhost -Port 12345

# 🔥 Vérifier les règles du pare-feu
netsh advfirewall firewall show rule name="Minecraft Server"

# 🌍 Tester la connexion depuis l'extérieur
Test-NetConnection -ComputerName VOTRE_IP -Port 12345
```

## ⚡ Problèmes de performance

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
<br>

## 🛑 Problèmes Courants

1. **Port occupé** : Changez le port dans `.env`
2. **Pas assez de RAM** : Augmentez `JAVA_ARGS` dans `.env`
3. **Modpack incompatible** : Vérifiez la version Minecraft (1.20.1)

### Logs Importants
- Logs du serveur : `docker-compose logs minecraft-server`
- Logs Docker : `docker logs prominence-minecraft-server`

### **Problème : Connexion refusée**
- Vérifiez que le serveur Minecraft est démarré : `docker ps`
- **Avec Port Forwarding** : Vérifiez la règle `NAT/PAT` sur le routeur
- Vérifiez `l'adresse IP public` et le `port`
- Vérifiez le `firewall Windows`

### **Problème : Port Forwarding ne fonctionne pas**
- Vérifiez que l'`IP statique` est configurée
- Vérifiez que la règle `NAT/PAT` est active
- Redémarrez le routeur
- Vérifiez que votre `FAI` ne bloque pas le port `12345` (exemle)


---
<br><br><br>
## 📝 Notes Importantes

- ⚠️ **EULA** : En utilisant ce serveur, vous acceptez l'EULA de Mojang
- 🔒 **Sécurité** : Le serveur fonctionne en **local** uniquement
- 💾 **Sauvegardes** : Les données sont sauvegardées automatiquement
- 🚀 **Performance** : Ce modpack nécessite au moins `4GB` de **RAM**

---

*Développé avec ❤️ pour une expérience Minecraft optimale*.
