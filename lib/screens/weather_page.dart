import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/glass_card.dart';

/// Weather page with static weather data and animated icon
class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  // Static weather data
  static const Map<String, dynamic> _weatherData = {
    'location': 'Jakarta, Indonesia',
    'temperature': 32,
    'condition': 'Sunny',
    'humidity': 65,
    'windSpeed': 12,
    'feelsLike': 35,
    'uvIndex': 8,
  };

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
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

                // Main weather display
                Center(
                  child: Column(
                    children: [
                      // Animated weather icon placeholder
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.wb_sunny,
                              size: 120,
                              color: Colors.yellow.shade300,
                            ),
                            // Replace with: Lottie.asset('assets/animations/weather_sunny.json')
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Temperature
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

                      // Condition
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

                // Weather details
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

                // Weekly forecast placeholder
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
                      _buildForecastItem('Mon', 'Sunny', 31, 24),
                      _buildForecastItem('Tue', 'Cloudy', 29, 23),
                      _buildForecastItem('Wed', 'Rainy', 27, 22),
                      _buildForecastItem('Thu', 'Sunny', 32, 25),
                      _buildForecastItem('Fri', 'Partly Cloudy', 30, 24),
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
