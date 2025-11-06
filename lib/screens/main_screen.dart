import 'package:flutter/material.dart';
import 'biodata_page.dart';
import 'contacts_page.dart';
import 'calculator_page.dart';
import 'weather_page.dart';
import 'news_page.dart';

/// Main screen with BottomNavigationBar hosting 5 pages
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  bool _isTransitioning = false;

  // List of pages
  final List<Widget> _pages = const [
    BiodataPage(),
    ContactsPage(),
    CalculatorPage(),
    WeatherPage(),
    NewsPage(),
  ];

  void _onTabTapped(int index) async {
    if (index == _currentIndex || _isTransitioning) return;

    setState(() {
      _isTransitioning = true;
    });

    // Wait for fade out
    await Future.delayed(const Duration(milliseconds: 50));

    // Change page
    setState(() {
      _currentIndex = index;
    });

    // Wait for fade in
    await Future.delayed(const Duration(milliseconds: 50));

    setState(() {
      _isTransitioning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          AnimatedOpacity(
            opacity: _isTransitioning ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 50),
            curve: Curves.easeInOut,
            child: _pages[_currentIndex],
          ),
          // White flash overlay
          IgnorePointer(
            child: AnimatedOpacity(
              opacity: _isTransitioning ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 40),
              curve: Curves.easeInOut,
              child: Container(color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey.shade400,
          selectedFontSize: 12,
          unselectedFontSize: 11,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Biodata',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts_outlined),
              activeIcon: Icon(Icons.contacts),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined),
              activeIcon: Icon(Icons.calculate),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny_outlined),
              activeIcon: Icon(Icons.wb_sunny),
              label: 'Weather',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              activeIcon: Icon(Icons.article),
              label: 'News',
            ),
          ],
        ),
      ),
    );
  }
}
