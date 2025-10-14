# 🚀 Guide de Démarrage - Serveur Minecraft Prominence II

## 🎯 Démarrage Rapide

### Démarrer le Serveur
```bash
# Option 1: Script automatique
start-server.bat

# Option 2: Commandes manuelles
docker-compose build
docker-compose up -d
```

## 🆘 Support

### Problèmes Courants
1. **Port occupé** : Changez le port dans `.env`
2. **Pas assez de RAM** : Augmentez `JAVA_ARGS` dans `.env`
3. **Modpack incompatible** : Vérifiez la version Minecraft (1.20.1)

### Logs Importants
- Logs du serveur : `docker-compose logs minecraft-server`
- Logs Docker : `docker logs prominence-minecraft-server`

---

*Développé avec ❤️ pour une expérience Minecraft optimale*
