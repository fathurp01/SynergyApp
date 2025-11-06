import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarCircle extends StatelessWidget {
  final String name;
  final double size;
  final String? imageUrl;

  const AvatarCircle({
    super.key,
    required this.name,
    this.size = 40,
    this.imageUrl,
  });

  String _getInitials(String name) {
    final words = name.split(' ');
    if (words.isEmpty) return '?';
    if (words.length == 1) return words[0][0].toUpperCase();
    return (words[0][0] + words[1][0]).toUpperCase();
  }

  Color _getColorFromName(String name) {
    final colors = [
      const Color(0xFF6C63FF),
      const Color(0xFF03DAC6),
      const Color(0xFFFF6584),
      const Color(0xFF4CAF50),
      const Color(0xFFFF9800),
      const Color(0xFF9C27B0),
      const Color(0xFF2196F3),
      const Color(0xFFE91E63),
    ];

    int hash = 0;
    for (int i = 0; i < name.length; i++) {
      hash = name.codeUnitAt(i) + ((hash << 5) - hash);
    }

    return colors[hash.abs() % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _getColorFromName(name),
            _getColorFromName(name).withOpacity(0.7),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: _getColorFromName(name).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: imageUrl != null
            ? ClipOval(
                child: Image.network(
                  imageUrl!,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildInitials();
                  },
                ),
              )
            : _buildInitials(),
      ),
    );
  }

  Widget _buildInitials() {
    return Text(
      _getInitials(name),
      style: GoogleFonts.poppins(
        fontSize: size * 0.4,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
