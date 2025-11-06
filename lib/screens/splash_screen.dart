import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_screen.dart';

/// Splash screen shown for exactly 5 seconds
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _progressController;
  late AnimationController _waveController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    // Main animation setup - Netflix-style
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Wave animation controller - very slow for aesthetic movement
    _waveController = AnimationController(
      duration: const Duration(seconds: 20), // 20 seconds for very slow wave
      vsync: this,
    )..repeat();

    // Progress animation controller - 5 seconds
    _progressController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    // Scale animation: starts small, grows to normal size, then slightly shrinks
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.3,
          end: 1.1,
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.1,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40,
      ),
    ]).animate(_controller);

    // Progress animation
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );

    // Fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
    _progressController.forward();

    // Navigate after exactly 5 seconds
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MainScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _waveController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Wave animation - behind identity section, from bottom to middle
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _waveController,
                builder: (context, child) {
                  return CustomPaint(
                    size: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height *
                          0.55, // From bottom to between app name and photo
                    ),
                    painter: SimpleWavePainter(
                      animationValue: _waveController.value,
                      primaryColor: Theme.of(context).colorScheme.primary,
                      secondaryColor: Theme.of(context).colorScheme.secondary,
                    ),
                  );
                },
              ),
            ),

            // Main content - wrapped in AnimatedBuilder for logo animation
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Center(
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // App Title with gradient
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0.9),
                              ],
                            ).createShader(bounds),
                            child: Text(
                              'SYNERGY',
                              style: GoogleFonts.poppins(
                                fontSize: 56,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: 8,
                                height: 1.2,
                              ),
                            ),
                          ),

                          // Subtitle
                          Text(
                            'ALL YOU NEED IN ONE APP',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.9),
                              letterSpacing: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // Developer info at bottom - wrapped in AnimatedBuilder
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  bottom: 80,
                  left: 0,
                  right: 0,
                  child: FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _controller,
                        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Developer Photo - smaller and more subtle
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.6),
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/profil.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Developer Info
                        Text(
                          'Fathurrahman Pratama Putra',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.95),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'NIM: 152023057',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.85),
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // Horizontal progress bar - wrapped in AnimatedBuilder
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  bottom: 40,
                  left: 40,
                  right: 40,
                  child: FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _controller,
                        curve: const Interval(0.7, 1.0, curve: Curves.easeIn),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Loading text
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            'Loading...',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.85),
                              fontWeight: FontWeight.w300,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        // Progress bar container
                        Container(
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: AnimatedBuilder(
                            animation: _progressAnimation,
                            builder: (context, child) {
                              return Stack(
                                children: [
                                  // Progress bar
                                  FractionallySizedBox(
                                    widthFactor: _progressAnimation.value,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(2),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white.withOpacity(
                                              0.5,
                                            ),
                                            blurRadius: 8,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Simple wave painter for aesthetic background effect
class SimpleWavePainter extends CustomPainter {
  final double animationValue;
  final Color primaryColor;
  final Color secondaryColor;

  SimpleWavePainter({
    required this.animationValue,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Wave parameters for slow, aesthetic movement - flatter waves
    final double waveHeight = 20.0; // Reduced from 35 to 20 for flatter waves
    final double frequency =
        1.5; // Reduced from 2 to 1.5 for wider, flatter waves

    // Very slow phase shift: 20 seconds per full cycle
    // During 5 sec splash: animationValue goes 0 to 0.25 (25% of cycle)
    final double phase = animationValue * 2 * math.pi;

    // First wave layer (increased opacity)
    final paint1 = Paint()
      ..color = Colors.white
          .withOpacity(0.15) // Increased from 0.08 to 0.15
      ..style = PaintingStyle.fill;

    final path1 = Path();
    path1.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 3) {
      final double y =
          size.height * 0.5 + // Changed from 0.4 to 0.5 for flatter top
          waveHeight *
              math.sin((x / size.width * frequency * 2 * math.pi) + phase);

      if (x == 0) {
        path1.moveTo(x, y);
      } else {
        path1.lineTo(x, y);
      }
    }

    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();
    canvas.drawPath(path1, paint1);

    // Second wave layer (increased opacity)
    final paint2 = Paint()
      ..color = Colors.white
          .withOpacity(0.10) // Increased from 0.05 to 0.10
      ..style = PaintingStyle.fill;

    final path2 = Path();
    path2.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 3) {
      final double y =
          size.height * 0.45 + // Changed from 0.35 to 0.45 for flatter top
          waveHeight *
              0.8 *
              math.sin(
                (x / size.width * frequency * 2 * math.pi) +
                    phase +
                    math.pi / 2,
              );

      if (x == 0) {
        path2.moveTo(x, y);
      } else {
        path2.lineTo(x, y);
      }
    }

    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();
    canvas.drawPath(path2, paint2);

    // Third wave layer (increased opacity)
    final paint3 = Paint()
      ..color = Colors.white
          .withOpacity(0.06) // Increased from 0.03 to 0.06
      ..style = PaintingStyle.fill;

    final path3 = Path();
    path3.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 3) {
      final double y =
          size.height * 0.4 + // Changed from 0.3 to 0.4 for flatter top
          waveHeight *
              0.6 *
              math.sin(
                (x / size.width * frequency * 2 * math.pi) + phase + math.pi,
              );

      if (x == 0) {
        path3.moveTo(x, y);
      } else {
        path3.lineTo(x, y);
      }
    }

    path3.lineTo(size.width, size.height);
    path3.lineTo(0, size.height);
    path3.close();
    canvas.drawPath(path3, paint3);
  }

  @override
  bool shouldRepaint(SimpleWavePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
