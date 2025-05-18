# Podkes App

**Podkes**, kullanıcıların podcast yayınlarını kolayca keşfedebileceği, dinleyebileceği ve favorilerine ekleyebileceği şık bir Flutter uygulamasıdır. Kullanıcı arayüzü modern ve sezgiseldir, veri yönetimi ise BLoC (Cubit) mimarisiyle sağlanmıştır. Gerçek podcast verileri ile çalışır ve kategori bazlı filtreleme sunar.

---

## 📸 Ekran Görüntüleri

Aşağıda uygulamanın farklı ekranlarına ait toplam 13 adet ekran görüntüsü yer almaktadır:

![screen1](screenshots/screen1.png)  
![screen2](screenshots/screen2.png)  
![screen3](screenshots/screen3.png)  
![screen4](screenshots/screen4.png)  
![screen5](screenshots/screen5.png)  
![screen6](screenshots/screen6.png)  
![screen7](screenshots/screen7.png)  
![screen8](screenshots/screen8.png)  
![screen9](screenshots/screen9.png)  
![screen10](screenshots/screen10.png)  
![screen11](screenshots/screen11.png)  
![screen12](screenshots/screen12.png)  
![screen13](screenshots/screen13.png)

---

## 🚀 Özellikler

- 🎙️ Podcast’leri kategorilere göre keşfetme
- 🔍 Arama çubuğu ile içerik bulma
- ❤️ Favorilere ekleme
- 🎧 Tam ekran oynatıcı (ileri-geri sarma, durdurma)
- 📁 Kişisel kütüphane
- 👤 Kullanıcı profili ve drawer menüsü
- 🌙 Karanlık mod
- ⭐ Uygulama puanlama popup’ı
- 🔔 Bildirim kontrol ekranı
- 🧭 Bottom navigation ve responsive yapı

---

## 🧰 Kullanılan Teknolojiler

| Teknoloji | Açıklama |
|----------|----------|
| Flutter  | Uygulama geliştirme framework'ü |
| Dart     | Programlama dili |
| Bloc/Cubit | State yönetimi |
| Dio      | API bağlantısı |
| GoRouter | Sayfa yönlendirme |
| Flutter Rating Bar | Puanlama popup’ı için |

---

## 🗂️ Proje Yapısı

```text
lib/
├── core/
│   ├── config/
│   ├── network/
│   ├── router/
│   └── widgets/
├── features/
│   ├── discover/
│   ├── favorites/
│   ├── now_playing/
│   ├── onboarding/
│   └── profile/
├── my_app.dart
├── podkes_app.dart
└── main.dart
```

---

## 🛠️ Kurulum

Projeyi çalıştırmak için:

```bash
flutter pub get
flutter run
```

> Android Studio veya VS Code önerilir.

---

## 🧪 Test

```bash
flutter test
```

---

## 👤 Geliştirici

- **Ad:** Orhan Gölcür  
- **E-posta:** orhangolcur0@gmail.com  
- **GitHub:** [github.com/orhangolcur](https://github.com/orhangolcur)

---

## 📄 Lisans

Bu proje sadece eğitim ve değerlendirme amacıyla geliştirilmiştir.
