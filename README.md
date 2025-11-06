# 🌟 SYNERGY APP - All You Need in One App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?style=for-the-badge&logo=dart)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**Aplikasi Mobile Multi-Fitur dengan Desain Modern dan Futuristik**

[📱 Demo](#-screenshot-aplikasi) • [🚀 Instalasi](#-cara-menjalankan-aplikasi) • [📚 Dokumentasi](#-dokumentasi-lengkap) • [👨‍💻 Developer](#-tentang-developer)

</div>

---

## 📋 IDENTITAS MAHASISWA

| **Informasi** | **Detail** |
|---------------|------------|
| **Nama Lengkap** | Fathurrahman Pratama Putra |
| **NIM** | 152023057 |
| **Kelas** | Pemrograman Mobile, AA |
| **Program Studi** | Teknik Informatika |
| **Mata Kuliah** | Pemrograman Mobile |
| **Dosen Pengampu** | Galih Ashari R., S.Si., MT  |
| **Institusi** | Institut Teknologi Nasional Bandung |
| **Semester** | Ganjil 2024/2025 |
| **Tugas** | UTS (Ujian Tengah Semester) |
| **Tanggal Pengumpulan** | 13 November 2025 |

---

## 📖 TENTANG PROYEK

**SynergyApp** adalah aplikasi mobile komprehensif yang dikembangkan menggunakan **Flutter Framework** sebagai pemenuhan tugas **Ujian Tengah Semester (UTS)** mata kuliah Pemrograman Mobile. 

Aplikasi ini menggabungkan berbagai fitur esensial dalam satu platform, mencakup manajemen biodata, daftar kontak, kalkulator matematika, informasi cuaca, dan portal berita - semuanya dengan antarmuka yang modern, intuitif, dan aesthetic.

### 🎯 Tujuan Pembelajaran

Proyek ini bertujuan untuk mendemonstrasikan kemampuan dalam:
- ✅ Implementasi **Fragment Pattern** untuk navigasi multi-halaman
- ✅ Pembuatan **UI/UX modern** dengan Material Design 3
- ✅ Pengelolaan **State Management** menggunakan StatefulWidget
- ✅ Penggunaan **Custom Widgets** yang reusable
- ✅ Implementasi **berbagai input types** (TextField, Dropdown, Radio, DatePicker)
- ✅ Pembuatan **layout responsif** untuk berbagai ukuran layar
- ✅ Penerapan **animasi smooth** untuk user experience yang lebih baik

---

## 🎨 FITUR-FITUR APLIKASI

### 1️⃣ **Splash Screen (Halaman Pembuka)**

**Durasi:** Tepat 5 detik  
**Fungsi:** Halaman pembuka aplikasi dengan animasi menarik

**Komponen:**
- 📱 **Judul Aplikasi**: "SYNERGY" dengan font besar dan letter spacing
- 📝 **Subtitle**: "ALL YOU NEED IN ONE APP"
- 📸 **Foto Developer**: Foto profil bulat dengan border putih
- 🆔 **NIM**: 152023057
- 👤 **Nama Developer**: Fathurrahman Pratama Putra
- 🌊 **Wave Animation**: Gelombang animasi di background (sangat lambat & aesthetic)
- ⏳ **Progress Bar**: Loading bar horizontal dengan animasi smooth
- ✨ **Animasi**: Scale & fade animation untuk logo

**Screenshot:**
<!-- Tambahkan screenshot splash screen di sini -->
![Splash Screen](assets/screenshots/splash.png)

**Cuplikan Kode:**
```dart
// Timer untuk navigasi otomatis setelah 5 detik
Timer(const Duration(seconds: 5), () {
  if (mounted) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const MainScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }
});
```

---

### 2️⃣ **Dashboard dengan Bottom Navigation**

**Konsep:** Fragment Pattern / Page Switching  
**Navigasi:** Bottom Navigation Bar dengan 5 menu utama

**Cara Kerja Fragment Pattern:**
```dart
class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;  // Index halaman yang aktif

  // List of Fragments (Pages)
  final List<Widget> _pages = const [
    BiodataPage(),      // Fragment 1
    ContactsPage(),     // Fragment 2
    CalculatorPage(),   // Fragment 3
    WeatherPage(),      // Fragment 4
    NewsPage(),         // Fragment 5
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_currentIndex],  // Ganti fragment berdasarkan index
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;  // Ubah index = ganti halaman
          });
        },
        // ... menu items
      ),
    );
  }
}
```

**5 Menu Utama:**
| Icon | Label | Halaman |
|------|-------|---------|
| 👤 | Biodata | Halaman informasi pribadi |
| 📇 | Contacts | Daftar kontak telepon |
| 🧮 | Calculator | Kalkulator matematika |
| 🌤️ | Weather | Informasi cuaca |
| 📰 | News | Portal berita teknologi |

**Screenshot:**
<!-- Tambahkan screenshot dashboard di sini -->
![Dashboard](assets/screenshots/dashboard.png)

---

### 3️⃣ **Halaman Biodata**

**Deskripsi:** Halaman untuk menampilkan dan mengedit informasi pribadi dengan berbagai jenis input form.

**Komponen Input:**

#### a) **TextField** (2 items)
```dart
TextFormField(
  controller: _nameController,
  decoration: const InputDecoration(
    labelText: 'Nama Lengkap',
    prefixIcon: Icon(Icons.person_outline),
  ),
)

TextFormField(
  controller: _hobiController,
  maxLines: 3,
  decoration: const InputDecoration(
    labelText: 'Hobi',
    prefixIcon: Icon(Icons.favorite_outline),
  ),
)
```

#### b) **Dropdown Button** (Jurusan)
```dart
DropdownButtonFormField<String>(
  value: _selectedJurusan,
  items: _jurusanList.map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
  onChanged: (String? newValue) {
    setState(() {
      _selectedJurusan = newValue!;
    });
  },
)
```
**Pilihan:** Informatika, Sistem Informasi, Teknik Elektro, Teknik Sipil

#### c) **Radio Button** (Jenis Kelamin)
```dart
RadioListTile<String>(
  title: const Text('Laki-laki'),
  value: 'Laki-laki',
  groupValue: _selectedGender,
  onChanged: (String? value) {
    setState(() {
      _selectedGender = value!;
    });
  },
)
```
**Pilihan:** Laki-laki, Perempuan

#### d) **Date Picker** (Tanggal Lahir)
```dart
Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: _selectedDate,
    firstDate: DateTime(1950),
    lastDate: DateTime(2010),
  );
  if (picked != null && picked != _selectedDate) {
    setState(() {
      _selectedDate = picked;
    });
  }
}
```

**Fitur Tambahan:**
- ✅ **Mode View/Edit**: Toggle untuk switch antara mode tampil dan edit
- ✅ **Foto Profil**: Circular avatar dengan border dan shadow
- ✅ **Glass Card Design**: Efek glassmorphism untuk container
- ✅ **Live Preview**: Data ditampilkan real-time saat input
- ✅ **Validasi**: Basic validation untuk input

**Data yang Ditampilkan:**
- Nama Lengkap
- NIM
- Jurusan (Dropdown)
- Jenis Kelamin (Radio)
- Tanggal Lahir (DatePicker)
- Hobi (TextField multiline)

**Screenshot:**
<!-- Tambahkan screenshot biodata di sini -->
![Biodata View Mode](assets/screenshots/biodata_view.png)
![Biodata Edit Mode](assets/screenshots/biodata_edit.png)

---

### 4️⃣ **Halaman Contacts**

**Deskripsi:** Daftar kontak telepon dengan layout modern dan interaktif.

**Spesifikasi:**
- 📊 **Jumlah Kontak**: 17 kontak (melebihi requirement minimal 15)
- 📱 **Data**: Nama lengkap + nomor telepon
- 🎨 **Layout**: Card dengan Circle Avatar + Text
- 💾 **Sumber Data**: Variable statis (tidak ada database)

**Data Statis:**
```dart
static const List<Map<String, String>> _contacts = [
  {'name': 'Alice Johnson', 'phone': '+62 812-3456-7890'},
  {'name': 'Bob Williams', 'phone': '+62 813-9876-5432'},
  {'name': 'Charlie Brown', 'phone': '+62 821-1111-2222'},
  {'name': 'Diana Prince', 'phone': '+62 822-3333-4444'},
  {'name': 'Edward Norton', 'phone': '+62 823-5555-6666'},
  // ... 12 kontak lainnya
  {'name': 'Quincy Jones', 'phone': '+62 877-1593-5748'},
];
```

**Fitur:**
- ✅ **Circle Avatar**: Warna dinamis berdasarkan nama
- ✅ **Card Layout**: Modern dengan shadow dan border
- ✅ **Action Buttons**: Icon untuk telepon dan pesan
- ✅ **Search Icon**: Di AppBar (UI only)
- ✅ **FAB**: Floating Action Button untuk tambah kontak (UI only)
- ✅ **Hero Animation**: Smooth transition saat tap
- ✅ **Header Info**: Total jumlah kontak

**Screenshot:**
<!-- Tambahkan screenshot contacts di sini -->
![Contacts List](assets/screenshots/contacts.png)

---

### 5️⃣ **Halaman Calculator**

**Deskripsi:** Kalkulator matematika lengkap dengan desain modern.

**Operasi Matematika yang Tersedia:**

| Operasi | Symbol | Fungsi | Validasi |
|---------|--------|--------|----------|
| **Penjumlahan** | + | `a + b` | ✅ |
| **Pengurangan** | - | `a - b` | ✅ |
| **Perkalian** | × | `a × b` | ✅ |
| **Pembagian** | ÷ | `a ÷ b` | ✅ Error jika b=0 |
| **Kuadrat** | x² | `a²` | ✅ |
| **Akar Kuadrat** | √ | `√a` | ✅ Error jika a<0 |
| **Clear** | C | Reset semua | ✅ |
| **Backspace** | ⌫ | Hapus digit terakhir | ✅ |

**Implementasi Kode:**
```dart
void _calculate() {
  double result;
  switch (_operator) {
    case '+':
      result = _firstOperand! + secondOperand;
      break;
    case '-':
      result = _firstOperand! - secondOperand;
      break;
    case '×':
      result = _firstOperand! * secondOperand;
      break;
    case '÷':
      if (secondOperand == 0) {
        _showError('Cannot divide by zero');
        return;
      }
      result = _firstOperand! / secondOperand;
      break;
  }
  setState(() {
    _display = _formatResult(result);
  });
}

void _onSquare() {
  final double? value = double.tryParse(_display);
  if (value == null) return;
  setState(() {
    final result = value * value;
    _display = _formatResult(result);
  });
}

void _onSquareRoot() {
  final double? value = double.tryParse(_display);
  if (value == null) return;
  if (value < 0) {
    _showError('Cannot calculate square root of negative number');
    return;
  }
  setState(() {
    final result = sqrt(value);
    _display = _formatResult(result);
  });
}
```

**Fitur:**
- ✅ **Display Ganda**: Expression + Result
- ✅ **Error Handling**: Division by zero, negative sqrt
- ✅ **Chain Calculation**: Operasi beruntun tanpa '='
- ✅ **Format Number**: Hasil dengan decimal yang rapi
- ✅ **Responsive Keypad**: Grid layout yang rapi
- ✅ **Visual Feedback**: Highlight saat tombol ditekan
- ✅ **Gradient Background**: Design yang modern

**Screenshot:**
<!-- Tambahkan screenshot calculator di sini -->
![Calculator](assets/screenshots/calculator.png)

---

### 6️⃣ **Halaman Weather**

**Deskripsi:** Informasi cuaca dengan data statis dan UI yang menarik.

**Data Cuaca Statis:**
```dart
static const Map<String, dynamic> _weatherData = {
  'location': 'Jakarta, Indonesia',
  'temperature': 32,
  'condition': 'Sunny',
  'humidity': 65,
  'windSpeed': 12,
  'feelsLike': 35,
  'uvIndex': 8,
};
```

**Informasi yang Ditampilkan:**
| Info | Value | Icon | Deskripsi |
|------|-------|------|-----------|
| **Lokasi** | Jakarta, Indonesia | 📍 | Kota |
| **Suhu** | 32°C | 🌡️ | Temperature saat ini |
| **Kondisi** | Sunny | ☀️ | Kondisi cuaca |
| **Kelembaban** | 65% | 💧 | Humidity |
| **Angin** | 12 km/h | 💨 | Wind speed |
| **Feels Like** | 35°C | 🌡️ | Suhu yang dirasakan |
| **UV Index** | 8 (High) | ☀️ | Indeks UV |

**Desain:**
- ✅ **Gradient Sky**: Background gradien biru langit
- ✅ **Weather Icon**: Icon animasi kondisi cuaca (bisa diganti Lottie)
- ✅ **Large Temperature**: Font 80px untuk suhu utama
- ✅ **Glass Cards**: Info detail dalam card transparan
- ✅ **Icons**: Material icons untuk setiap data point
- ✅ **Forecast Section**: Prakiraan 7 hari (static)

**Upgrade Path (Optional):**
```dart
// Ganti Icon dengan Lottie Animation
Lottie.asset(
  'assets/animations/weather_sunny.json',
  width: 200,
  height: 200,
)
```

**Screenshot:**
<!-- Tambahkan screenshot weather di sini -->
![Weather](assets/screenshots/weather.png)

---

### 7️⃣ **Halaman News**

**Deskripsi:** Portal berita teknologi dengan layout card yang modern.

**Spesifikasi:**
- 📰 **Jumlah Berita**: 8 artikel
- 🎨 **Layout**: Card dengan pattern berulang (seperti Contacts)
- 💾 **Data**: Statis dari variable

**Data Berita Statis:**
```dart
static const List<Map<String, String>> _newsItems = [
  {
    'title': 'Flutter 3.5 Released with Amazing Features',
    'summary': 'Google announces the latest version of Flutter...',
    'category': 'Technology',
    'date': '2 hours ago',
  },
  {
    'title': 'AI Revolution in Mobile Development',
    'summary': 'Artificial Intelligence is transforming...',
    'category': 'AI & ML',
    'date': '5 hours ago',
  },
  // ... 6 berita lainnya
];
```

**Setiap Card Berita Menampilkan:**
- 🖼️ **Thumbnail**: Placeholder image (bisa diganti dengan gambar nyata)
- 📰 **Title**: Judul berita (bold, 2 lines max)
- 📝 **Summary**: Ringkasan berita (3 lines max)
- 🏷️ **Category Badge**: Tag kategori dengan warna
- 🕐 **Date**: Waktu publish (relative time)
- 🔖 **Bookmark Icon**: Icon untuk save (UI only)

**Kategori yang Tersedia:**
- Technology (Biru)
- AI & ML (Ungu)
- Development (Hijau)
- Design (Orange)
- Flutter (Cyan)

**Fitur:**
- ✅ **ListView Builder**: Repeating pattern untuk cards
- ✅ **Header Banner**: Gradient banner dengan info
- ✅ **Category Chips**: Filter kategori (UI only)
- ✅ **Smooth Scroll**: Scroll yang halus
- ✅ **Card Elevation**: Shadow untuk depth
- ✅ **Tap Interaction**: Visual feedback saat tap

**Screenshot:**
<!-- Tambahkan screenshot news di sini -->
![News List](assets/screenshots/news.png)

---

## 🎨 DESAIN & UI/UX

### Material Design 3
Aplikasi ini mengimplementasikan **Material Design 3 (Material You)** dengan komponen modern:

- ✅ **Color Scheme**: Dynamic theming dengan primary & secondary colors
- ✅ **Typography**: Google Fonts (Poppins) untuk konsistensi
- ✅ **Elevation**: Subtle shadows untuk depth perception
- ✅ **Border Radius**: Rounded corners (8-20px)
- ✅ **Spacing**: Consistent padding & margins (8, 12, 16, 24px)

### Glassmorphism Effect
```dart
class GlassCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            backgroundColor.withOpacity(0.7),
            backgroundColor.withOpacity(0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      // Blur effect would go here with BackdropFilter
    );
  }
}
```

### Animasi
- **Fade Transitions**: Halaman berpindah dengan fade
- **Scale Animations**: Logo bounce di splash screen
- **Hero Animations**: Smooth transition untuk images
- **Wave Animation**: Background wave di splash (sangat lambat)
- **Progress Bar**: Linear animation untuk loading

### Color Palette
```dart
ColorScheme.fromSeed(
  seedColor: const Color(0xFF6C63FF),  // Primary: Ungu modern
  secondary: const Color(0xFF03DAC6),  // Secondary: Cyan/Teal
  brightness: Brightness.light,
)
```

---

## 🛠️ TEKNOLOGI & DEPENDENCIES

### Framework
- **Flutter**: 3.9.2 (Stable)
- **Dart**: 3.0+

### Dependencies (pubspec.yaml)
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8      # iOS style icons
  google_fonts: ^6.2.1         # Typography (Poppins)
  lottie: ^3.1.3              # Animasi (optional)
  provider: ^6.1.2            # State management (future use)
```

### Dev Dependencies
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0       # Code quality
```

---

## 📁 STRUKTUR PROYEK LENGKAP

```
synergy_app/
├── android/                        # Android native files
├── ios/                           # iOS native files
├── lib/
│   ├── main.dart                  # 🚀 Entry point & App theme
│   ├── screens/
│   │   ├── splash_screen.dart     # 🎯 Splash (5 detik)
│   │   ├── main_screen.dart       # 🏠 Main container + BottomNav
│   │   ├── biodata_page.dart      # 👤 Biodata dengan forms
│   │   ├── contacts_page.dart     # 📇 17 kontak statis
│   │   ├── calculator_page.dart   # 🧮 Kalkulator lengkap
│   │   ├── weather_page.dart      # 🌤️ Info cuaca Jakarta
│   │   └── news_page.dart         # 📰 8 berita teknologi
│   └── widgets/
│       ├── glass_card.dart        # 💎 Reusable glassmorphism
│       ├── avatar_circle.dart     # ⭕ Avatar dengan inisial
│       └── app_button.dart        # 🔘 Custom button widget
├── assets/
│   ├── images/
│   │   ├── profil.jpg            # 📸 Foto developer
│   │   └── .gitkeep
│   ├── animations/
│   │   └── .gitkeep              # 🎬 Lottie files (optional)
│   └── screenshots/              # 📱 Screenshot untuk README
│       ├── splash.png
│       ├── biodata_view.png
│       ├── biodata_edit.png
│       ├── contacts.png
│       ├── calculator.png
│       ├── weather.png
│       └── news.png
├── test/                          # Unit tests
├── .gitignore
├── pubspec.yaml                   # Dependencies & assets
├── README.md                      # 📖 Dokumentasi ini
└── LICENSE                        # MIT License
```

---

## 🚀 CARA MENJALANKAN APLIKASI

### Prasyarat

Pastikan sudah terinstall:
- ✅ [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.x atau lebih baru)
- ✅ [Android Studio](https://developer.android.com/studio) atau [VS Code](https://code.visualstudio.com/)
- ✅ Emulator Android atau iOS Simulator
- ✅ Git untuk clone repository

### Langkah-langkah Instalasi

#### 1. Clone Repository
```bash
git clone https://github.com/fathurp01/SynergyApp.git
cd synergy_app
```

#### 2. Install Dependencies
```bash
flutter pub get
```

#### 3. Cek Konfigurasi Flutter
```bash
flutter doctor
```
Pastikan tidak ada error (✓ = OK)

#### 4. Jalankan Aplikasi

**Menggunakan Command Line:**
```bash
# Run di debug mode
flutter run

# Run di release mode (lebih cepat)
flutter run --release
```

**Menggunakan VS Code:**
1. Buka folder `synergy_app` di VS Code
2. Tekan `F5` atau klik Run > Start Debugging
3. Pilih device (emulator/physical device)

**Menggunakan Android Studio:**
1. Open Project > Pilih folder `synergy_app`
2. Klik tombol Run (▶️) di toolbar
3. Pilih device target

#### 5. Build APK (Optional)
```bash
# Build APK release
flutter build apk --release

# Output: build/app/outputs/flutter-apk/app-release.apk
```

#### 6. Install APK ke Device
```bash
flutter install
```

---

## 📸 SCREENSHOT APLIKASI

### 1. Splash Screen (5 Detik)
<!-- Ganti dengan screenshot Anda -->
![Splash Screen](assets/screenshots/splash.png)
> Halaman pembuka dengan logo SYNERGY, foto developer, NIM, nama, dan wave animation

### 2. Dashboard - Bottom Navigation
<!-- Ganti dengan screenshot Anda -->
![Dashboard](assets/screenshots/dashboard.png)
> Main screen dengan 5 menu di bottom navigation bar

### 3. Biodata - View Mode
<!-- Ganti dengan screenshot Anda -->
![Biodata View](assets/screenshots/biodata_view.png)
> Tampilan biodata lengkap dengan foto profil dan informasi

### 4. Biodata - Edit Mode
<!-- Ganti dengan screenshot Anda -->
![Biodata Edit](assets/screenshots/biodata_edit.png)
> Mode edit dengan berbagai input: TextField, Dropdown, Radio, DatePicker

### 5. Contacts - List 17 Kontak
<!-- Ganti dengan screenshot Anda -->
![Contacts](assets/screenshots/contacts.png)
> Daftar 17 kontak dengan circle avatar dan action buttons

### 6. Calculator - Operasi Matematika
<!-- Ganti dengan screenshot Anda -->
![Calculator](assets/screenshots/calculator.png)
> Kalkulator dengan operasi +, -, ×, ÷, x², √, C

### 7. Weather - Info Cuaca Jakarta
<!-- Ganti dengan screenshot Anda -->
![Weather](assets/screenshots/weather.png)
> Informasi cuaca lengkap dengan suhu, kelembaban, angin, UV index

### 8. News - Portal Berita Teknologi
<!-- Ganti dengan screenshot Anda -->
![News](assets/screenshots/news.png)
> Daftar 8 berita dengan card layout, kategori, dan timestamp

---

## ✅ CHECKLIST REQUIREMENT UTS

### A) Splash Screen ✅
- [x] Durasi tepat 5 detik
- [x] Menampilkan judul aplikasi "SYNERGY"
- [x] Menampilkan foto developer (profil.jpg)
- [x] Menampilkan NIM: 152023057
- [x] Menampilkan nama: Fathurrahman Pratama Putra
- [x] Animasi smooth (scale, fade, wave)
- [x] Progress bar loading
- [x] Auto navigate ke Dashboard

### B) Dashboard dengan Fragment Pattern ✅
- [x] Menggunakan BottomNavigationBar
- [x] 5 Menu: Biodata, Contacts, Calculator, Weather, News
- [x] Konsep Fragment (page switching dengan AnimatedSwitcher)
- [x] Smooth transition antar halaman
- [x] Layout lengkap untuk semua menu
- [x] Tidak reload seluruh app saat pindah menu

### C) Halaman Biodata ✅
- [x] Foto profil dengan border dan shadow
- [x] TextField: Nama Lengkap & Hobi (2 items)
- [x] Dropdown: Jurusan (4 pilihan)
- [x] Radio Button: Jenis Kelamin (2 pilihan)
- [x] DatePicker: Tanggal Lahir (calendar dialog)
- [x] Toggle View/Edit mode
- [x] Data tidak disimpan ke database (state only)
- [x] Desain modern dengan glassmorphism

### D) Halaman Contacts ✅
- [x] Minimal 15 kontak (tersedia 17)
- [x] Layout: Circle Image + Text
- [x] Data statis dari variable
- [x] Nama lengkap dan nomor telepon
- [x] Action buttons (call & message)
- [x] Search icon di AppBar
- [x] FAB untuk add contact
- [x] Card layout yang modern

### E) Halaman Calculator ✅
- [x] Operasi Tambah (+)
- [x] Operasi Kurang (-)
- [x] Operasi Kali (×)
- [x] Operasi Bagi (÷)
- [x] Operasi Kuadrat (x²)
- [x] Operasi Akar Kuadrat (√)
- [x] Tombol Clear (C)
- [x] Tombol Backspace (⌫)
- [x] Error handling (div zero, negative sqrt)
- [x] Display expression dan result

### F) Halaman Cuaca ✅
- [x] Data statis (tidak API)
- [x] Informasi Suhu (32°C)
- [x] Informasi Kelembaban (65%)
- [x] Informasi Kecepatan Angin (12 km/h)
- [x] Informasi UV Index (8)
- [x] Feels Like temperature (35°C)
- [x] Icon/Animasi cuaca yang cakep
- [x] Gradient background langit
- [x] Layout responsif

### G) Halaman Berita ✅
- [x] Data statis (8 berita)
- [x] Pola tampilan berulang (ListView)
- [x] Card layout dengan thumbnail
- [x] Title, summary, category, date
- [x] Category badges dengan warna
- [x] Bookmark icon
- [x] Header banner gradient
- [x] Smooth scrolling

### H) Requirement Teknis ✅
- [x] Upload ke GitHub dengan deskripsi lengkap
- [x] Screenshot semua halaman di README
- [x] Deskripsi fitur dan teknologi
- [x] Cara instalasi dan menjalankan
- [x] Struktur folder yang jelas
- [x] Code snippet untuk fitur penting
- [x] Identitas mahasiswa di README
- [x] LICENSE file (MIT)
- [x] .gitignore yang proper

---

## 📚 DOKUMENTASI LENGKAP

### Konsep Fragment Pattern

**Apa itu Fragment?**
Fragment adalah konsep dari Android native development yang memungkinkan kita membuat UI modular yang dapat di-swap/diganti tanpa reload seluruh aplikasi.

**Implementasi di Flutter:**

1. **Container (Main Screen)** - Tetap di memori
```dart
class MainScreen extends StatefulWidget {
  // Ini adalah "bingkai" yang tidak berubah
}
```

2. **List of Fragments** - Pages yang bisa diganti
```dart
final List<Widget> _pages = const [
  BiodataPage(),      // Fragment index 0
  ContactsPage(),     // Fragment index 1
  CalculatorPage(),   // Fragment index 2
  WeatherPage(),      // Fragment index 3
  NewsPage(),         // Fragment index 4
];
```

3. **Index Selector** - State untuk track fragment aktif
```dart
int _currentIndex = 0;
```

4. **Switcher Mechanism** - Ganti fragment
```dart
body: AnimatedSwitcher(
  duration: const Duration(milliseconds: 300),
  child: _pages[_currentIndex],  // Switch berdasarkan index
)
```

5. **Navigation Trigger** - Event handler
```dart
onTap: (index) {
  setState(() {
    _currentIndex = index;  // Ubah index = ganti halaman
  });
}
```

**Keuntungan:**
- ⚡ Performance lebih baik (tidak reload app)
- 🎨 Smooth transitions
- 💾 State fragment terjaga
- 🔧 Mudah maintenance (separated concerns)

---

### Custom Widgets yang Dibuat

#### 1. GlassCard Widget
Reusable widget untuk efek glassmorphism:
```dart
GlassCard(
  child: Column(
    children: [
      Text('Content goes here'),
    ],
  ),
)
```

#### 2. AvatarCircle Widget
Avatar dengan inisial dan warna dinamis:
```dart
AvatarCircle(
  name: 'Fathurrahman Pratama Putra',
  size: 48,
)
```

#### 3. AppButton Widget
Custom button untuk calculator:
```dart
AppButton(
  text: '+',
  onPressed: () => _onOperatorPressed('+'),
  color: Colors.blue,
)
```

---

### State Management

Aplikasi ini menggunakan **StatefulWidget** untuk state management sederhana:

```dart
class _BiodataPageState extends State<BiodataPage> {
  // State variables
  bool _isEditMode = false;
  String _selectedJurusan = 'Informatika';
  DateTime _selectedDate = DateTime(2005, 1, 30);

  // Update state
  void _toggleEditMode() {
    setState(() {
      _isEditMode = !_isEditMode;
    });
  }
}
```

**Kenapa StatefulWidget?**
- Simple untuk aplikasi kecil-menengah
- Tidak perlu library external
- Performance cukup untuk requirement ini
- Easy to understand untuk pembelajaran

---

## 🔒 CATATAN PENTING

### Data Statis (Tidak Persisten)
⚠️ **PENTING**: Semua data dalam aplikasi ini bersifat **STATIS** dan **TIDAK DISIMPAN**

- ❌ Tidak ada database (SQLite/Hive/etc)
- ❌ Tidak ada SharedPreferences
- ❌ Tidak ada API backend
- ❌ Data input tidak persisten setelah app restart
- ✅ Semua data dari hard-coded variables/constants
- ✅ Cocok untuk demonstrasi UI/UX dan konsep Fragment

### Upgrade Path (Untuk Pengembangan Lanjutan)

Jika ingin dikembangkan lebih lanjut:

1. **Database**
   - Gunakan `sqflite` untuk database lokal
   - Atau `hive` untuk NoSQL storage

2. **API Integration**
   - Weather API: OpenWeatherMap
   - News API: NewsAPI.org
   - Contacts: Backend REST API

3. **State Management**
   - Upgrade ke Provider/Riverpod
   - Atau gunakan Bloc untuk complex state

4. **Animations**
   - Tambah Lottie animations
   - Custom rive animations

5. **Testing**
   - Unit tests untuk logic
   - Widget tests untuk UI
   - Integration tests untuk flow

---

## 📄 LISENSI

```
MIT License

Copyright (c) 2025 Fathurrahman Pratama Putra

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 👨‍💻 TENTANG DEVELOPER

<div align="center">

### Fathurrahman Pratama Putra

**NIM:** 152023057  
**Program Studi:** Teknik Informatika  
**Institut:** Institut Teknologi Nasional Bandung

**Kontak:**
- 📧 Email: [email Anda]
- 💼 LinkedIn: [profile LinkedIn]
- 🐙 GitHub: [@fathurp01](https://github.com/fathurp01)

</div>

---

## 🙏 ACKNOWLEDGMENTS

Terima kasih kepada:
- **[Nama Dosen]** - Dosen Pengampu Mata Kuliah Pemrograman Mobile
- **Flutter Team** - Framework yang luar biasa
- **Material Design Team** - Design system yang comprehensive
- **Stack Overflow Community** - Untuk problem solving
- **Teman-teman Kelas** - Diskusi dan saling membantu

---

## 📝 CATATAN AKHIR

### Tentang Tugas Ini

Proyek ini dikembangkan sebagai **Ujian Tengah Semester (UTS)** mata kuliah Pemrograman Mobile di Institut Teknologi Nasional Bandung.

**Tujuan Pengembangan:**
- ✅ Memahami konsep Fragment Pattern dalam mobile development
- ✅ Implementasi berbagai jenis input (TextField, Dropdown, Radio, DatePicker)
- ✅ Membuat UI/UX modern dengan Material Design 3
- ✅ Pengelolaan state dengan StatefulWidget
- ✅ Navigasi multi-halaman dengan BottomNavigationBar
- ✅ Pembuatan custom widgets yang reusable
- ✅ Implementasi animasi untuk better UX

**Disclaimer:**
- Proyek ini dibuat untuk keperluan **pembelajaran dan evaluasi akademik**
- Data bersifat **statis/dummy** dan tidak untuk produksi
- Kode dapat digunakan sebagai **referensi belajar** dengan mencantumkan sumber

### Timeline Pengerjaan
- **Start**: [Tanggal mulai]
- **Finish**: [Tanggal selesai]
- **Deadline**: 13 November 2025 23:59 WIB

---

<div align="center">

### ⭐ TERIMA KASIH ⭐

**Dibuat dengan ❤️ menggunakan Flutter**

© 2025 Fathurrahman Pratama Putra. All Rights Reserved.

[🔝 Kembali ke Atas](#-synergy-app---all-you-need-in-one-app)

</div>