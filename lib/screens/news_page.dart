import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  static const List<Map<String, String>> _newsItems = [
    {
      'title': 'Nusantara Capital City Begins Operations in 2025',
      'summary':
          'Indonesia\'s new capital city in East Kalimantan officially operates as the new center of government with modern and eco-friendly infrastructure.',
      'category': 'National',
      'date': '2 hours ago',
    },
    {
      'title': 'Indonesia Wins Gold at SEA Games 2025',
      'summary':
          'Indonesian esports team successfully won gold medals in Mobile Legends and PUBG Mobile, bringing pride to the nation at SEA Games.',
      'category': 'Sports',
      'date': '5 hours ago',
    },
    {
      'title': 'Fuel Price Increase Sparks Public Protests',
      'summary':
          'Government policy to raise fuel prices has sparked protests from various groups and labor organizations across Indonesia.',
      'category': 'Economy',
      'date': '1 day ago',
    },
    {
      'title': 'MSME Digitalization Boosts Local Economy',
      'summary':
          'Government-supported MSME digitalization program successfully increased small business sales by 150% through e-commerce platforms.',
      'category': 'Business',
      'date': '1 day ago',
    },
    {
      'title': 'COVID-19 Booster Vaccination Reaches 80%',
      'summary':
          'Indonesia records remarkable achievement with booster vaccination rate reaching 80% of the adult population target across the archipelago.',
      'category': 'Health',
      'date': '2 days ago',
    },
    {
      'title': 'Jakarta Floods: Thousands Evacuated',
      'summary':
          'Heavy rainfall caused massive flooding in Jakarta and surrounding areas, forcing thousands of residents to evacuate to safer locations.',
      'category': 'Disaster',
      'date': '2 days ago',
    },
    {
      'title': 'Indonesian Startup Secures \$50 Million Funding',
      'summary':
          'Bandung-based tech startup successfully raised \$50 million in Series B funding from foreign investors for Southeast Asia expansion.',
      'category': 'Technology',
      'date': '3 days ago',
    },
    {
      'title': 'Nusantara Culinary Festival in Bali',
      'summary':
          'Indonesia\'s largest culinary festival showcases 500+ traditional dishes from 34 provinces, attracting domestic and international tourists.',
      'category': 'Culture',
      'date': '3 days ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'News',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // === Header Banner ===
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stay Updated',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Latest tech news & updates',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.newspaper, color: Colors.white, size: 48),
              ],
            ),
          ),

          // === News List ===
          Expanded(
            child: ListView.builder(
              itemCount: _newsItems.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return _buildNewsCard(context, _newsItems[index], index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(
    BuildContext context,
    Map<String, String> news,
    int index,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Opening: ${news['title']}')));
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'news_$index',
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary.withOpacity(0.7),
                        Theme.of(
                          context,
                        ).colorScheme.secondary.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: const Icon(
                    Icons.article,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        news['category']!,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      news['title']!,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      news['summary']!,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey.shade500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          news['date']!,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
