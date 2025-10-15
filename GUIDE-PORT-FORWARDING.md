# 🌐 Guide Port Forwarding - Connexion Distante

### *Comment permettre à vos amis de se connecter à votre serveur Minecraft*

---

## 🎯 Vue d'Ensemble

Le **Port Forwarding** permet à des joueurs externes de se connecter à votre serveur Minecraft depuis l'**ADRESSE IP PUBLIC** de votre routeur (box) Internet. Ce guide vous explique comment configurer votre routeur pour autoriser ces connexions.

> **⚠️ Important** : Le port forwarding expose votre serveur à Internet. Assurez-vous de comprendre les implications de sécurité.

---

## 🔧 Configuration du Routeur

### 1. 🏠 **Accéder à votre Routeur**

**Adresses communes :**
- `http://192.168.1.1` (le plus courant)
- `http://192.168.0.1`
- `http://10.0.0.1`
- `http://192.168.1.254`

**Identifiants par défaut :**
- **Utilisateur** : `admin`
- **Mot de passe** : `admin` ou `password`
- *Consultez l'étiquette de votre routeur pour les identifiants exacts*

### 2. 🔒 **Configuration IP Statique (OBLIGATOIRE)**

> **⚠️ Critique** : Sans IP statique, le port forwarding ne fonctionnera pas

**Étapes :**
1. Allez dans **"Réseau"** → **"DHCP"** ou **"Adresses IP"**
2. Cherchez **"Réservation d'adresse"** ou **"Adresses fixes"**
3. Ajoutez votre PC :
   ```
   Adresse MAC : [MAC de votre PC]
   Adresse IP : 192.168.1.100    (exemple)
   Nom : PC-User-Desktop
   ```

**Trouver votre adresse MAC :**
```bash
# Dans PowerShell
ipconfig /all
# Cherchez "Adresse physique" de votre carte réseau
```

### 3. 🔀 **Configuration Port Forwarding**

**Étapes :**
1. Allez dans **"Réseau"** → **"NAT/PAT"** ou **"Règles de trafic"**
2. Cliquez sur **"Créer une règle NAT/PAT"** ou **"Ajouter une règle"**
3. Remplissez le formulaire :

```
✅ Activer : Oui
✅ Application/Service : Minecraft Server (ou autres)
✅ Port interne : 12345                   (votre port choisi)
✅ Port externe : 12345                   (même port)
✅ Protocole : TCP
✅ Équipement : [Votre PC - 192.168.1.100]
✅ IP externe : 0.0.0.0/0                 (ou laissez vide)
```

4. **Sauvegardez** la configuration
5. **Redémarrez** le routeur si demandé

> **ℹ️ Pour certains Routeur (Box)** : Lors de la configuration, il peux vous demander d'appuyer sur le bouton **"WPS"** de votre routeur pour appliquer les changement.

---

## 🌍 Trouver votre IP Publique

### **Méthode Simple**
```bash
# Dans PowerShell
curl ifconfig.me
# ou visitez : https://whatismyipaddress.com/
```

### **Vérification**
- Votre IP publique ressemble à : `98.148.1.1` (exemple)
- Cette IP change généralement à chaque redémarrage du routeur

---

## 🎮 Configuration pour vos Amis

### **Informations à Partager**

**Pour Minecraft :**
- **Version** : Minecraft `1.20.1`
- **Modpack** : Prominence II: Hasturian Era `v3.9.1`
- **Adresse** : `VOTRE_IP_PUBLIC:PORT`
  - Exemple : `98.148.1.1:12345`

### **Instructions pour vos Amis**

1. **Installer le modpack** via [CursForge](https://www.curseforge.com/download/app)
2. **Lancer Minecraft** sur CurseForge avec le [Modpack](https://www.curseforge.com/minecraft/modpacks/prominence-2-rpg)

3. **Multiplayer** → **Add Server**
4. **Server Address** : `VOTRE_IP_PUBLIC:PORT`
5. **Connect**

---

## 🛡️ Sécurité et Bonnes Pratiques

### **⚠️ Risques du Port Forwarding**

- 🔒 **Exposition Internet** : Votre serveur est accessible depuis le monde entier
- 🚫 **FAI** : Certains fournisseurs d'accès bloquent les serveurs
- 🔧 **Complexité** : Configuration technique requise
- 💰 **Coûts** : Certains FAI facturent les IP statiques

### **✅ Bonnes Pratiques**

- **Pare-feu** : Configurez Windows Firewall pour autoriser le port
- **Mot de passe** : Utilisez un mot de passe fort sur votre serveur
- **Whitelist** : Limitez l'accès aux joueurs autorisés
- **Sauvegardes** : Sauvegardez régulièrement vos mondes
- **Monitoring** : Surveillez les connexions suspectes

---

## 🔧 Dépannage Port Forwarding

### **Problème : Connexion refusée**

**Vérifications :**
```bash
# 1. Vérifier que le serveur fonctionne
docker-compose ps

# 2. Vérifier le port local
netstat -an | findstr :12345

# 3. Tester la connexion locale
Test-NetConnection -ComputerName localhost -Port 12345
```

**Solutions :**
- ✅ Vérifiez que l'IP statique est configurée
- ✅ Vérifiez que la règle NAT/PAT est active
- ✅ Redémarrez le routeur
- ✅ Vérifiez le pare-feu Windows

### **Problème : IP publique change**

**Solutions :**
- **IP statique** : Contactez votre FAI pour une IP fixe
- **DNS dynamique** : Utilisez un service comme No-IP ou DynDNS
- **VPN** : Utilisez un VPN avec IP fixe

### **Problème : FAI bloque le port**

**Solutions :**
- **Changer de port** : Essayez un port différent (80, 443, 8080)
- **Contacter le FAI** : Demandez l'ouverture du port
- **VPN** : Utilisez un VPN pour contourner les restrictions

---

## 📚 Ressources Utiles

### **Outils de Test**
- **Port Checker** : [portchecker.co](https://portchecker.co/)
- **IP Publique** : [whatismyipaddress.com](https://whatismyipaddress.com/)
- **Test de Port** : [canyouseeme.org](https://canyouseeme.org/)

### **Documentation Routeurs**
- **TP-Link** : [tp-link.com/support](https://www.tp-link.com/support/)
- **Netgear** : [netgear.com/support](https://www.netgear.com/support/)
- **Linksys** : [linksys.com/support](https://www.linksys.com/support/)

### **Services DNS Dynamique**
- **No-IP** : [noip.com](https://www.noip.com/)
- **DynDNS** : [dyn.com](https://dyn.com/)
- **DuckDNS** : [duckdns.org](https://www.duckdns.org/)

---

## 🎉 Résumé

**Pour permettre la connexion distante :**

1. ✅ **Configurez une IP statique** sur votre PC
2. ✅ **Activez le port forwarding** sur votre routeur
3. ✅ **Trouvez votre IP publique**
4. ✅ **Partagez l'adresse** avec vos amis
5. ✅ **Configurez le pare-feu** Windows

**Adresse finale :** `VOTRE_IP_PUBLIC:PORT`

---

*Guide développé avec ❤️ pour une expérience Minecraft multijoueur optimale*
