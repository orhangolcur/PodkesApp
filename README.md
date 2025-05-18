# Podkes App

**Podkes**, kullanıcıların podcast yayınlarını kolayca keşfedebileceği, dinleyebileceği ve favorilerine ekleyebileceği şık bir Flutter uygulamasıdır. Kullanıcı arayüzü modern ve sezgiseldir, veri yönetimi ise BLoC (Cubit) mimarisiyle sağlanmıştır. Gerçek podcast verileri ile çalışır ve kategori bazlı filtreleme sunar.

## 🚀 Özellikler

- 🎙️ Podcast’leri kategorilere göre keşfetme (Komedi, Teknoloji, Eğitim, vb.)
- 🔍 Arama çubuğu ile içerik bulma
- ❤️ Favorilere ekleme sistemi
- 🎧 Tam ekran oynatıcı (play, pause, ileri/geri alma)
- 📁 Kişisel kütüphane oluşturma
- 👤 Kullanıcı profili ve menü
- 🌙 Karanlık mod
- ⭐ Uygulama puanlama pop-up’ı
- 🔔 Bildirim durumu kontrolü
- 🧭 Drawer ve bottom navigation yapısı

---

## 🧰 Kullanılan Teknolojiler

| Teknoloji | Açıklama |
|----------|----------|
| **Flutter** | Uygulama geliştirme framework’ü |
| **Dart** | Flutter için kullanılan dil |
| **Cubit (Bloc)** | State yönetimi için |
| **GoRouter** | Navigasyon kontrolü |
| **Dio** | REST API üzerinden veri çekimi |
| **Flutter Rating Bar** | Kullanıcı puanlama için |

---

## 🗂️ Proje Yapısı

```text
lib/
├── core/
│   ├── config/       # Uygulama konfigürasyonları
│   ├── network/      # API client ayarları
│   ├── router/       # GoRouter yönetimi
│   └── widgets/      # Ortak bileşenler (BottomNav, AppBar vs.)
│
├── features/
│   ├── discover/     # Podcast keşif sistemi
│   ├── favorites/    # Favorilere ekleme ve görüntüleme
│   ├── now_playing/  # Podcast oynatıcı ekranı
│   ├── onboarding/   # Uygulama ilk açılış tanıtımı
│   └── profile/      # Profil ekranı ve puanlama
│
├── my_app.dart       # MaterialApp tanımı
├── podkes_app.dart   # Uygulama başlangıç noktası
└── main.dart         # Entry point
```

---

## 🛠️ Kurulum

Projeyi çalıştırmak için aşağıdaki adımları izleyin:

```bash
flutter pub get
flutter run
```

> Geliştirme ortamı olarak **Android Studio** veya **VS Code** önerilir.

---

## 🧪 Test

Cubit ile oluşturulan bileşenler test edilebilir yapıdadır. Test komutu:

```bash
flutter test
```

---

## 👤 Geliştirici

- **Ad Soyad:** Orhan Gölcür  
- **E-posta:** orhangolcur0@gmail.com  
- **GitHub:** [github.com/KULLANICIADI](https://github.com/KULLANICIADI)

---

## 📄 Lisans

Bu proje sadece eğitim ve değerlendirme amaçlı geliştirilmiştir. Tüm hakları saklıdır.
