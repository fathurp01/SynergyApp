# 📦 Assets Guide - SynergyApp

## 📁 Directory Structure

```
assets/
├── images/
│   ├── developer_photo.png       # Your photo (recommended: 400x400px)
│   ├── profile_placeholder.png   # Profile avatar (recommended: 300x300px)
│   └── news_placeholder.png      # News thumbnail (recommended: 200x200px)
├── animations/
│   └── weather_sunny.json        # Lottie animation for weather
└── screenshots/
    ├── splash.png
    ├── biodata.png
    ├── contacts.png
    ├── calculator.png
    ├── weather.png
    └── news.png
```

## 🖼️ Image Requirements

### 1. Developer Photo (`developer_photo.png`)
- **Location**: `assets/images/developer_photo.png`
- **Usage**: Splash screen
- **Size**: 400x400px (square)
- **Format**: PNG with transparency
- **Description**: Your professional photo

### 2. Profile Placeholder (`profile_placeholder.png`)
- **Location**: `assets/images/profile_placeholder.png`
- **Usage**: Biodata page profile image
- **Size**: 300x300px (square)
- **Format**: PNG
- **Description**: Generic profile picture or your photo

### 3. News Placeholder (`news_placeholder.png`)
- **Location**: `assets/images/news_placeholder.png`
- **Usage**: News item thumbnails
- **Size**: 200x200px
- **Format**: PNG or JPG
- **Description**: Technology/news related image

## 🎬 Animation Requirements

### Weather Animation (`weather_sunny.json`)
- **Location**: `assets/animations/weather_sunny.json`
- **Usage**: Weather page animated icon
- **Format**: Lottie JSON
- **Source**: Download from [LottieFiles](https://lottiefiles.com/)
- **Recommended search**: "weather sunny", "sun animation"
- **Free options available**: Yes

#### How to Get Lottie Animation:
1. Visit [https://lottiefiles.com/](https://lottiefiles.com/)
2. Search for "weather sunny" or "sun"
3. Download the JSON file (free account required)
4. Rename to `weather_sunny.json`
5. Place in `assets/animations/`

## 📸 Screenshot Guidelines

Take screenshots of your running app and save them in `assets/screenshots/`:

### Required Screenshots:
1. **splash.png** - Splash screen showing logo, photo, NIM, and name
2. **biodata.png** - Biodata page with all input fields filled
3. **contacts.png** - Contacts list showing multiple contacts
4. **calculator.png** - Calculator with a calculation displayed
5. **weather.png** - Weather page showing all weather information
6. **news.png** - News page with news list

### Screenshot Tips:
- Use Android Emulator or physical device
- Take screenshots in portrait mode
- Ensure good visibility of all UI elements
- Use consistent device/screen size
- Recommended resolution: 1080x1920 or similar

## 🔄 Using Placeholders (Current State)

The app currently uses **icon placeholders** for all images:
- Splash screen: `Icons.person` (white)
- Biodata profile: `Icons.person` (purple)
- News thumbnails: `Icons.article` (gradient)
- Weather icon: `Icons.wb_sunny` (yellow)

### To Replace Placeholders:

#### In `splash_screen.dart` (line ~96):
```dart
// Current:
child: const Icon(Icons.person, size: 60, color: Color(0xFF6C63FF)),

// Replace with:
child: ClipOval(
  child: Image.asset(
    'assets/images/developer_photo.png',
    fit: BoxFit.cover,
    width: 100,
    height: 100,
  ),
),
```

#### In `biodata_page.dart` (line ~106):
```dart
// Current:
child: const Icon(Icons.person, size: 60, color: Colors.white),

// Replace with:
child: ClipOval(
  child: Image.asset(
    'assets/images/profile_placeholder.png',
    fit: BoxFit.cover,
    width: 120,
    height: 120,
  ),
),
```

#### In `weather_page.dart` (line ~66):
```dart
// Current:
Icon(Icons.wb_sunny, size: 120, color: Colors.yellow.shade300),

// Replace with:
Lottie.asset(
  'assets/animations/weather_sunny.json',
  width: 200,
  height: 200,
),
```

#### In `news_page.dart` (line ~149):
```dart
// Current:
child: const Icon(Icons.article, color: Colors.white, size: 32),

// Replace with:
child: ClipRRect(
  borderRadius: BorderRadius.circular(12),
  child: Image.asset(
    'assets/images/news_placeholder.png',
    fit: BoxFit.cover,
    width: 80,
    height: 80,
  ),
),
```

## ✅ Quick Setup Checklist

- [ ] Create `assets/images/` directory
- [ ] Add your photo as `developer_photo.png`
- [ ] Add profile image as `profile_placeholder.png`
- [ ] Add news thumbnail as `news_placeholder.png`
- [ ] Download Lottie animation
- [ ] Place Lottie file as `weather_sunny.json`
- [ ] Run `flutter pub get`
- [ ] Update code to use real assets (optional)
- [ ] Take screenshots of all pages
- [ ] Save screenshots in `assets/screenshots/`
- [ ] Update README.md with your screenshots

## 🚀 Running Without Custom Assets

The app is **fully functional without custom assets**! 

All placeholders (icons) will work perfectly. Custom assets only enhance the visual appearance.

## 📝 Notes

- All asset paths are already configured in `pubspec.yaml`
- Asset directories are already created
- The app will run with icon placeholders if assets are missing
- Adding real assets is optional but recommended for better presentation
- Don't forget to update the README.md screenshot section!
