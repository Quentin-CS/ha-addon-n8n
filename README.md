# Home Assistant Add-on: N8N

![N8N Logo](https://n8n.io/n8n-logo.png)

N8N est un outil d'automatisation de workflows open source qui vous permet de connecter vos applications et services préférés.

## Fonctionnalités

- 🔄 **Automatisation No-Code / Low-Code** : créez des workflows visuellement
- 🔗 **400+ intégrations** : connectez vos apps (Google, Slack, GitHub, HA, etc.)
- 🏠 **Intégration Home Assistant** : déclenchez des automatisations HA depuis N8N
- 🔒 **Self-hosted** : vos données restent chez vous
- 📦 **Données persistantes** : vos workflows survivent aux mises à jour

## Installation rapide

1. [![Ouvrir dans Home Assistant](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https://github.com/Quentin-CS/ha-addon-n8n)

2. Installez l'addon **N8N**
3. Configurez et démarrez

## Structure du projet

```
ha-addon-n8n/
├── config.yaml          # Configuration de l'addon HA
├── Dockerfile           # Image Docker
├── build.yaml           # Config de build multi-arch
├── DOCS.md              # Documentation détaillée
├── README.md            # Ce fichier
└── rootfs/
    └── etc/
        └── services.d/
            └── n8n/
                ├── run      # Script de démarrage s6
                └── finish   # Script d'arrêt s6
```

## Licence

MIT License — voir [LICENSE](LICENSE) pour plus de détails.
