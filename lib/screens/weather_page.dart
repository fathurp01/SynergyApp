import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/glass_card.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>
    with TickerProviderStateMixin {
  late AnimationController _cloudController;
  late AnimationController _glowController;
  late Animation<double> _cloudAnimation;
  late Animation<double> _glowAnimation;

  static const Map<String, dynamic> _weatherData = {
    'location': 'Bandung, Indonesia',
    'temperature': 28,
    'condition': 'Partly Cloudy',
    'humidity': 70,
    'windSpeed': 8,
    'feelsLike': 30,
    'uvIndex': 6,
  };

  @override
  void initState() {
    super.initState();

    _cloudController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat(reverse: true);

    _cloudAnimation = Tween<double>(begin: -8.0, end: 8.0).animate(
      CurvedAnimation(parent: _cloudController, curve: Curves.easeInOut),
    );

    _glowController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.4, end: 0.6).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _cloudController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF6C63FF),
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // === Header ===
                Text(
                  'Weather',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _weatherData['location'] as String,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 32),

                // === Main Weather Display ===
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 280,
                        height: 200,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            AnimatedBuilder(
                              animation: _cloudAnimation,
                              builder: (context, child) {
                                return Positioned(
                                  left: 30 + _cloudAnimation.value,
                                  top: 60,
                                  child: Icon(
                                    Icons.cloud,
                                    size: 90,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                );
                              },
                            ),
                            AnimatedBuilder(
                              animation: _glowAnimation,
                              builder: (context, child) {
                                return Center(
                                  child: Container(
                                    width: 110,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.orange.shade400,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.orange.shade300
                                              .withOpacity(
                                                _glowAnimation.value,
                                              ),
                                          blurRadius: 40,
                                          spreadRadius: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              right: 30,
                              top: 55,
                              child: Icon(
                                Icons.cloud,
                                size: 130,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_weatherData['temperature']}',
                            style: GoogleFonts.poppins(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                          Text(
                            '°C',
                            style: GoogleFonts.poppins(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _weatherData['condition'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      Text(
                        'Feels like ${_weatherData['feelsLike']}°C',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // === Weather Details ===
                GlassCard(
                  backgroundColor: Colors.white.withOpacity(0.15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _buildWeatherDetail(
                            icon: Icons.water_drop,
                            label: 'Humidity',
                            value: '${_weatherData['humidity']}%',
                          ),
                          const SizedBox(width: 24),
                          _buildWeatherDetail(
                            icon: Icons.air,
                            label: 'Wind Speed',
                            value: '${_weatherData['windSpeed']} km/h',
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          _buildWeatherDetail(
                            icon: Icons.wb_sunny_outlined,
                            label: 'UV Index',
                            value: '${_weatherData['uvIndex']}',
                          ),
                          const SizedBox(width: 24),
                          _buildWeatherDetail(
                            icon: Icons.thermostat,
                            label: 'Feels Like',
                            value: '${_weatherData['feelsLike']}°C',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // === Weekly Forecast ===
                GlassCard(
                  backgroundColor: Colors.white.withOpacity(0.15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '7-Day Forecast',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildForecastItem('Mon', 'Partly Cloudy', 28, 21),
                      _buildForecastItem('Tue', 'Cloudy', 27, 20),
                      _buildForecastItem('Wed', 'Rainy', 25, 19),
                      _buildForecastItem('Thu', 'Partly Cloudy', 29, 22),
                      _buildForecastItem('Fri', 'Sunny', 30, 23),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherDetail({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: Colors.white.withOpacity(0.9), size: 32),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForecastItem(String day, String condition, int high, int low) {
    IconData icon;
    switch (condition.toLowerCase()) {
      case 'sunny':
        icon = Icons.wb_sunny;
        break;
      case 'cloudy':
      case 'partly cloudy':
        icon = Icons.cloud;
        break;
      case 'rainy':
        icon = Icons.grain;
        break;
      default:
        icon = Icons.wb_sunny;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              day,
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Icon(icon, color: Colors.yellow.shade300, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              condition,
              style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.8)),
            ),
          ),
          Text(
            '$high° / $low°',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
