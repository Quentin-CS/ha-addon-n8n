# Home Assistant Add-on: N8N

## Installation

1. Ajoutez ce dépôt à vos sources d'addons Home Assistant.
2. Installez l'addon **N8N** depuis le store.
3. Configurez les options selon vos besoins.
4. Démarrez l'addon.
5. Accédez à N8N via l'interface Home Assistant (onglet **N8N** dans la sidebar) ou via `http://<your-ha-ip>:5678`.

---

## Configuration

### Option: `ssl` (bool, requis)

Active ou désactive HTTPS. Par défaut : `false`.

### Option: `certfile` (str)

Nom du fichier certificat SSL (dans `/ssl/`). Exemple : `fullchain.pem`.

### Option: `keyfile` (str)

Nom du fichier clé privée SSL (dans `/ssl/`). Exemple : `privkey.pem`.

### Option: `username` (str)

Nom d'utilisateur pour l'authentification de base. Laissez vide pour désactiver.

### Option: `password` (str)

Mot de passe pour l'authentification de base.

### Option: `timezone` (str)

Fuseau horaire pour N8N. Exemple : `Europe/Paris`.

### Option: `webhook_url` (str)

URL publique pour les webhooks N8N (utile derrière un reverse proxy ou Nabu Casa).  
Exemple : `https://mon-ha.ui.nabu.casa/api/hassio_ingress/XXXX`

---

## Intégration avec Home Assistant

N8N peut interagir avec Home Assistant via :

- **Webhook HA** : créez des automatisations HA déclenchées par N8N.
- **REST API HA** : utilisez le nœud HTTP Request dans N8N avec `http://supervisor/core/api` et un token Long-Lived Access Token.
- **MQTT** : utilisez un broker MQTT partagé entre HA et N8N.

### Exemple de requête vers l'API HA depuis N8N

```
URL      : http://supervisor/core/api/states/light.salon
Méthode  : GET
Headers  : Authorization: Bearer <VOTRE_TOKEN_HA>
```

---

## Données persistantes

Tous les workflows et credentials N8N sont sauvegardés dans `/data/n8n/` et survivent aux mises à jour de l'addon.

---

## Support

- [Documentation N8N](https://docs.n8n.io)
- [Forum Home Assistant](https://community.home-assistant.io)
