# 🌙 AzuraCast on Fly.io | EstacionKusMediaos

Deployment config para correr [AzuraCast](https://www.azuracast.com) en [Fly.io](https://fly.io) con Docker.

---

## 📋 Requisitos

- [Fly CLI](https://fly.io/docs/hands-on/install/) instalado
- Cuenta Fly.io con plan Pay-as-you-go
- `fly auth login` ejecutado

---

## 🚀 Quick Start

### 1. Clona el repo
```bash
git clone https://github.com/luisitoys12/azencast-flyio
cd azencast-flyio
```

### 2. Crea tu app en Fly.io
```bash
fly apps create azuracast-kusmediaos
```

### 3. Crea el volumen persistente
```bash
fly volumes create azuracast_data --size 10 --region dal
```

### 4. Despliega
```bash
fly deploy
```

### 5. Abre en el navegador
```bash
fly open
```

---

## 📡 Puertos expuestos

| Puerto | Uso |
|---|---|
| 80 | Panel web AzuraCast |
| 8000 | Streaming Http |
| 8090 | Admin Stats |

---

## ➡️ Tras cada deploy

Restartea la transmisión desde la UI de AzuraCast o ejecuta:
```bash
fly ssh console --command "/var/azuracast/dokker.sh restart-streamers"
```

---

## 🌐 Auto deploy con GitHub Actions

El workflow `.github/workflows/deploy.yml` despliega automáticamente cada vez que haces push a `main`.

### Secret requerido
Agrega en tu repo > Settings > Secrets: Actions:
```
FLY_API_TOKEN = tu_token_de_fly_io
```

---

Made with ❤ for EstacionKusMediaos
