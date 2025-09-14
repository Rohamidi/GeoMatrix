# GeoMatrix — *Embiggen Your Eyes!*

> Zoom through ultra-large NASA Earth imagery, scrub time, and label what you discover — **one Flutter codebase for Web & Mobile**.

<p align="center">
  <img src="docs/assets/hero.png" alt="GeoMatrix Hero" width="820">
</p>

<p align="center">
  <img alt="Flutter" src="https://img.shields.io/badge/Flutter-Web%20%7C%20Mobile-02569B?logo=flutter&logoColor=white">
  <img alt="Made with Dart" src="https://img.shields.io/badge/Dart-❤-0175C2?logo=dart&logoColor=white">
  <img alt="NASA GIBS" src="https://img.shields.io/badge/Data-NASA%20EOSDIS%20GIBS-0B3D2E">
  <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-2ea44f">
</p>

---

## ✨ What is GeoMatrix?

**GeoMatrix** is a clean, modern viewer for **massive NASA Earth imagery**. It lets anyone:

* **Deep zoom & pan** across billions of pixels (tiled layers)
* **Time-travel** with a date slider (before/after comparison)
* **Annotate** discoveries with simple pins and labels
* **Export** annotations (JSON/GeoJSON) for sharing or analysis

Built for the **NASA International Space Apps** challenge — with a focus on performance, clarity, and accessibility.

---

## 🌍 Data

We use **NASA EOSDIS GIBS** (Global Imagery Browse Services) WMTS tiles in Web Mercator:

* Base layer (default): `MODIS_Terra_CorrectedReflectance_TrueColor` (daily global true color)
* URL pattern (example):

  ```
  https://gibs.earthdata.nasa.gov/wmts/epsg3857/best/
  MODIS_Terra_CorrectedReflectance_TrueColor/default/{time}/
  GoogleMapsCompatible_Level9/{z}/{y}/{x}.jpg
  ```
* `{time}` = `YYYY-MM-DD`
* Add overlays later (fires, floods, dust) with the same pattern.

> **Attribution:** *Imagery © NASA EOSDIS GIBS*. Please include this credit in any derivative work.

---

## 🧭 Why it matters

Earth data is huge — but insights are hidden until we **zoom**, **compare time**, and **label** what we see. GeoMatrix turns that into a fast, intuitive workflow usable by students, citizen scientists, and researchers.

---

## 🗺️ Features

* **Fluid map experience** (60fps pan/zoom where possible)
* **Time slider** to explore daily imagery
* **Annotations**: tap/long-press to drop pins, add labels + confidence
* **Export**: download your findings as JSON/GeoJSON (local-only MVP)
* **Single codebase**: Flutter powers Web + Android + iOS

---

## 🧱 Architecture (Flutter)

```
lib/
  main.dart                  # App entry & routing
  theme/                     # Brand theme (dark + green accents)
  map/                       # MapView, tile layers, date slider
  annotations/               # Model, state, export utils
  data/                      # Layer catalog + date utilities
assets/
  config/layers.json         # Layer IDs, tile matrix, formats, date range
docs/
  assets/                    # Screenshots/GIFs for README & demo
```

*Config example (`assets/config/layers.json`):*

```json
{
  "dateRange": { "start": "2025-08-15", "end": "2025-09-14" },
  "defaultLayer": "trueColor",
  "layers": {
    "trueColor": {
      "id": "MODIS_Terra_CorrectedReflectance_TrueColor",
      "projection": "epsg3857",
      "matrix": "GoogleMapsCompatible_Level9",
      "format": "jpg",
      "attribution": "Imagery © NASA EOSDIS GIBS"
    }
  }
}
```

---

## ⚙️ Quick start

### Prereqs

* Flutter SDK (stable), Chrome for web, Android/iOS toolchains as needed

```bash
flutter doctor
flutter config --enable-web
```

### Run

```bash
# Install deps
flutter pub get

# Web
flutter run -d chrome

# Android (example)
flutter emulators --launch <id>
flutter run -d <deviceId>

# iOS (on macOS)
open ios/Runner.xcworkspace   # first build
flutter run -d iphone
```

---

## 🧩 How to use

1. **Pick a date** with the slider
2. **Zoom** to your region of interest
3. **Long-press / tap** to drop a pin
4. **Label** it (e.g., “burn scar”, “smoke plume”)
5. **Export** your annotations as JSON/GeoJSON

*Annotation schema (MVP):*

```json
{
  "id": "uuid",
  "lat": 41.7151,
  "lng": 44.8271,
  "label": "dust plume",
  "confidence": 0.8,
  "date": "2025-09-01",
  "layer": "trueColor"
}
```

---

## 🎬 Demo flow (60–90s)

* Open GeoMatrix → set date **D1**
* Zoom to a prepared showcase (docs list)
* Slide to **D2** → observe change
* Drop 2 pins (“active fire”, “smoke trail”)
* Export JSON → show contents

---

## 🖌️ Design choices

* **Dark UI** with **green accents** (GeoMatrix vibe)
* Minimal chrome; controls float on the map
* Clear attribution + tiny legend (“Pick date → Zoom → Label → Export”)

---

## 🗺️ Roadmap

* Layer picker (fires, floods, snow/ice)
* Polygon annotations + distance/area tools
* Timelapse (GIF) for a date range
* Firebase auth + cloud sync + share links
* Basic moderation/collaboration

---

## 🤝 Contributing

PRs and issues welcome!
Please:

* Keep layers & dates in `assets/config/layers.json`
* Add screenshots/GIFs for UI changes
* Use concise, descriptive commit messages

---

## 📜 License & credits

* **Code:** MIT (see `LICENSE`)
* **Data:** *Imagery © NASA EOSDIS GIBS* — follow NASA usage & attribution guidance.

---

## 📷 Gallery

<p align="center">
  <img src="docs/assets/web.png" alt="Web App" width="45%">
  <img src="docs/assets/mobile.png" alt="Mobile App" width="45%">
</p>

---

## 🙌 Acknowledgments

* **NASA Space Apps** for the challenge & community
* **EOSDIS GIBS** team for open, high-quality global imagery

---
