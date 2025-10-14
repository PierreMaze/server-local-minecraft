# 🌐 Guide de connexion à distance - Connexion au Serveur Minecraft

## 🎯 **Objectif**
Permettre à un autre utilisateur de se connecter à distance dans votre serveur Minecraft.

## 🚀 **Solution 1 : ngrok (Recommandée)**

### **Avantages :**
- ✅ **Simple** : Via connexion sur site Web puis un clique
- ✅ **Sécurisé** : Tunnel chiffré
- ✅ **Gratuit** : Version gratuite disponible
- ✅ **Rapide** : Configuration en 30 secondes

### **Comment utiliser :**

#### **1. Démarrer le tunnel**
```bash
# Option 1: Script automatique
start-ngrok.bat

# Option 2: Commande manuelle
ngrok tcp 12345
```

#### **2. Configurer le Token**
- Récuperer votre token via leur site web : [Récuperer ici](https://dashboard.ngrok.com/get-started/your-authtoken) 
- Puis le mettre dans la valeur **TOKEN_NGROK** du fichier [**.env**](.env)
```javascript
TOKEN_NGROK=341gIgKvwcfGxitIdWkPbI1KxqC_87AfkcCdXXW778aqyHE4e
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
- **Tunnel actif** : Le `tunnel` doit **rester ouvert**E pendant que vous jouez

## 🔧 **Solution 2 : Port Forwarding (Avancée)**

### **Configuration routeur  :**

#### **1. Accéder au routeur**
- **Adresse** : `http://192.168.1.1`
- **Identifiants** : `admin` / `admin` (ou vérifiez l'étiquette du routeur)

#### **2. Configuration IP statique (OBLIGATOIRE)**
- Allez dans **"Réseau"** → **"DHCP"**
- Cherchez **"Réservation d'adresse"** ou **"Adresses fixes"**
- Ajoutez votre PC :
  ```
  Adresse MAC : [MAC de votre PC]
  Adresse IP : 192.168.1.11
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
  ✅ Équipement : [Votre PC - 192.168.1.11]
  ✅ IP externe : 0.0.0.0/0 (ou vide)
  ```
- Votre routeur peux vous **demander d'appuyer** sur le bouton `WPS` du routeur (de la Box).
- Sauvegardez et redémarrez le routeur si demandé

--------------------
### **Configuration pour autres routeurs :**

#### **Routeurs génériques :**
1. **Accédez à votre routeur** : `192.168.1.1` ou `192.168.0.1`
2. **Port Forwarding** : Redirigez le port `12345` vers votre PC
3. **IP statique** : Configurez une `Adresse IP fixe` pour votre PC
4. **Adresse publique** : Utilisez votre `Adresse IP publique`

### **⚠️ Risques :**
- 🔒 **Sécurité** : Exposition directe à Internet
- 🚫 **ISP** : Certains FAI bloquent les serveurs
- 🔧 **Complexe** : Configuration technique requise

## 🎮 **Instructions pour votre ami**

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
telnet 0.tcp.ngrok.io: 12345
```

## 📊 **Comparaison des solutions**

| Solution | Simplicité | Sécurité | Coût | Performance |
|----------|------------|----------|------|-------------|
| **Ngrok** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | Gratuit | ⭐⭐⭐⭐ |
| **Port Forwarding** | ⭐⭐ | ⭐⭐ | Gratuit | ⭐⭐⭐⭐⭐ |

## 🚀 **Démarrage rapide**

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

## 🆘 **Dépannage**

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

### **Résumé des solutions :**
- **ngrok** : Simple et rapide, mais nécessite une carte de crédit pour les `tunnels TCP`
- **Port Forwarding** : **Plus complexe** mais **plus stable et performant**

---

*Développé avec ❤️ pour une expérience Minecraft optimale*