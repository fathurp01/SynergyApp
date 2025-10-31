# 🧩 SynergyApp 🌟

---

## 📋 Identitas Mahasiswa

**Nama:** Fathurrahman Pratama Putra  
**NIM:** 152023057  
**Kelas:** AA  
**Mata Kuliah:** Pemrograman Mobile  
**Dosen Pengampu:** Galih Ashari R., S.Si., MT  
**Institusi:** Institut Teknologi Nasional Bandung  
**Semester:** Ganjil 2024/2025

---

## 💡 Tentang Proyek

**SynergyApp** adalah aplikasi mobile yang dikembangkan menggunakan Flutter sebagai pemenuhan tugas **UTS Pemrograman Mobile**. Aplikasi ini mendemonstrasikan berbagai fitur dan konsep fundamental dalam pengembangan aplikasi mobile modern dengan desain yang futuristik dan user-friendly.

## ✨ Fitur Utama

### 1. 🎯 Splash Screen
- Tampil selama **tepat 5 detik**
- Menampilkan logo aplikasi
- Menampilkan foto developer
- Menampilkan NIM dan Nama
- Animasi fade-in yang smooth
- Transisi otomatis ke Dashboard

### 2. 👤 Biodata
- Tampilan profil dengan foto
- Input form lengkap:
  - **TextField**: Nama Lengkap & Hobi
  - **Dropdown**: Pilihan Jurusan
  - **RadioButton**: Jenis Kelamin
  - **DatePicker**: Tanggal Lahir
- Ringkasan data real-time
- Desain glassmorphism yang modern

### 3. 📇 Contacts
- Daftar **17 kontak** statis
- Avatar dengan warna dinamis berdasarkan nama
- Informasi lengkap: nama & nomor telepon
- Aksi cepat: panggil & kirim pesan
- Search icon untuk pencarian
- Tombol tambah kontak

### 4. 🧮 Calculator
- Operasi matematika lengkap:
  - ✅ Penjumlahan (+)
  - ✅ Pengurangan (-)
  - ✅ Perkalian (×)
  - ✅ Pembagian (÷)
  - ✅ Kuadrat (x²)
  - ✅ Akar Kuadrat (√)
  - ✅ Clear (C)
  - ✅ Backspace (⌫)
- Error handling (pembagian dengan nol)
- Tampilan hasil real-time
- UI responsif dengan keypad modern
- Validasi input otomatis

### 5. 🌤️ Weather
- Data cuaca statis untuk Jakarta
- Informasi lengkap:
  - Suhu saat ini
  - Kondisi cuaca
  - Kelembaban
  - Kecepatan angin
  - UV Index
  - Feels like temperature
- Ikon cuaca animasi
- Prakiraan 7 hari
- Desain gradient yang menarik

### 6. 📰 News
- Daftar 8 berita teknologi terkini
- Setiap item menampilkan:
  - Thumbnail
  - Judul berita
  - Ringkasan
  - Kategori
  - Waktu publikasi
- Layout Card yang modern
- Hero animation pada tap
- Banner header informatif

## 🎨 Desain & UI/UX

- ✅ **Material Design 3** dengan tema modern
- ✅ **Glassmorphism cards** dengan efek blur
- ✅ **Gradient backgrounds** yang soft
- ✅ **Rounded corners** di semua komponen
- ✅ **Subtle shadows** untuk depth
- ✅ **Google Fonts** (Poppins) untuk typography
- ✅ **Micro-animations** (fade, hero transitions)
- ✅ **Bottom Navigation Bar** untuk navigasi utama
- ✅ **Accessible design** dengan kontras yang baik
- ✅ **Responsive layout** untuk berbagai ukuran layar

## 🛠️ Teknologi

- **Framework**: Flutter 3.x
- **Language**: Dart
- **State Management**: StatefulWidget
- **Dependencies**:
  - `google_fonts: ^6.2.1` - Typography
  - `lottie: ^3.1.3` - Animations
  - `provider: ^6.1.2` - State management

## 📁 Struktur Proyek

```
synergy_app/
├── lib/
│   ├── main.dart                    # Entry point & theme config
│   ├── screens/
│   │   ├── splash_screen.dart       # Splash screen (5s)
│   │   ├── main_screen.dart         # Main container dengan BottomNav
│   │   ├── biodata_page.dart        # Halaman Biodata
│   │   ├── contacts_page.dart       # Halaman Kontak (17 items)
│   │   ├── calculator_page.dart     # Halaman Kalkulator
│   │   ├── weather_page.dart        # Halaman Cuaca
│   │   └── news_page.dart           # Halaman Berita
│   └── widgets/
│       ├── glass_card.dart          # Reusable glassmorphism card
│       ├── avatar_circle.dart       # Circular avatar dengan inisial
│       └── app_button.dart          # Custom button widget
├── assets/
│   ├── images/                      # Placeholder untuk gambar
│   ├── animations/                  # Placeholder untuk Lottie files
│   └── screenshots/                 # Screenshot aplikasi
├── pubspec.yaml
├── README.md
└── LICENSE
```

## 🚀 Cara Menjalankan

### Prasyarat
- Flutter SDK (3.x atau lebih baru)
- Dart SDK
- Android Studio / VS Code dengan Flutter plugin
- Emulator atau device fisik

### Langkah-langkah

1. **Clone repository**
   ```bash
   git clone https://github.com/fathurp01/SynergyApp.git
   cd synergy_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Jalankan aplikasi**
   ```bash
   flutter run
   ```

4. **Build APK (optional)**
   ```bash
   flutter build apk --release
   ```

## 📸 Screenshot

> *Tambahkan screenshot aplikasi Anda di folder `assets/screenshots/`*

### Splash Screen
![Splash Screen](assets/screenshots/splash.png)

### Biodata Page
![Biodata](assets/screenshots/biodata.png)

### Contacts Page
![Contacts](assets/screenshots/contacts.png)

### Calculator Page
![Calculator](assets/screenshots/calculator.png)

### Weather Page
![Weather](assets/screenshots/weather.png)

### News Page
![News](assets/screenshots/news.png)

## � Catatan Pengembangan

### Data Statis
- ✅ Semua data menggunakan **hard-coded arrays/constants**
- ✅ Tidak ada backend atau API eksternal
- ✅ Tidak ada database lokal atau SharedPreferences
- ✅ Data input tidak persisten setelah restart

### Navigasi
- ✅ Menggunakan **BottomNavigationBar**
- ✅ 5 halaman utama sebagai widget terpisah
- ✅ Smooth page transitions dengan AnimatedSwitcher

### Assets (Opsional untuk Hasil Terbaik)
Untuk hasil terbaik, tambahkan file berikut:
- `assets/images/developer_photo.png` - Foto Anda untuk splash screen
- `assets/images/profile_placeholder.png` - Foto profil untuk biodata
- `assets/images/news_placeholder.png` - Thumbnail untuk berita
- `assets/animations/weather_sunny.json` - Animasi Lottie cuaca (download dari [LottieFiles](https://lottiefiles.com/))

## ✅ Checklist Requirement UTS

- [x] Project name: `synergy_app`
- [x] App title: **SynergyApp**
- [x] Flutter 3.x dengan Material 3
- [x] Splash screen 5 detik dengan info developer
- [x] BottomNavigationBar dengan 5 halaman
- [x] Biodata: Dropdown, RadioGroup, TextField, DatePicker
- [x] Contacts: 15+ kontak statis dengan ListView
- [x] Calculator: +, -, ×, ÷, x², √, C dengan error handling
- [x] Weather: Data statis dengan ikon animasi
- [x] News: Card layout dengan thumbnail & summary
- [x] UI modern & futuristik (glassmorphism, gradients)
- [x] Google Fonts & micro-animations
- [x] Accessible & responsive design
- [x] README Bahasa Indonesia dengan identitas di atas
- [x] .gitignore & LICENSE

## 📄 Lisensi

MIT License - lihat file [LICENSE](LICENSE) untuk detail.

## 👨‍💻 Developer

Dikembangkan dengan ❤️ oleh **Fathurrahman Pratama Putra**

---

**Catatan:** Proyek ini dibuat untuk memenuhi persyaratan **UTS Pemrograman Mobile** di Institut Teknologi Nasional Bandung dan tidak dimaksudkan untuk penggunaan produksi.

© 2025 Fathurrahman Pratama Putra. All rights reserved.

