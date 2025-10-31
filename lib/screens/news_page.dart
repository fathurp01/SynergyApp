import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// News page with static news items
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  // Static news data
  static const List<Map<String, String>> _newsItems = [
    {
      'title': 'Flutter 3.5 Released with Amazing Features',
      'summary':
          'Google announces the latest version of Flutter with improved performance and new widgets for better app development.',
      'category': 'Technology',
      'date': '2 hours ago',
    },
    {
      'title': 'AI Revolution in Mobile Development',
      'summary':
          'Artificial Intelligence is transforming how we build mobile applications, making development faster and smarter.',
      'category': 'AI & ML',
      'date': '5 hours ago',
    },
    {
      'title': 'Best Practices for Clean Code',
      'summary':
          'Learn the essential principles of writing maintainable, scalable, and clean code in modern software development.',
      'category': 'Development',
      'date': '1 day ago',
    },
    {
      'title': 'Material 3 Design System Guide',
      'summary':
          'Comprehensive guide to implementing Material You design system in your Flutter applications.',
      'category': 'Design',
      'date': '1 day ago',
    },
    {
      'title': 'State Management in Flutter',
      'summary':
          'Comparing different state management solutions: Provider, Riverpod, Bloc, and GetX.',
      'category': 'Flutter',
      'date': '2 days ago',
    },
    {
      'title': 'The Future of Mobile Apps',
      'summary':
          'Industry experts predict trends that will shape mobile application development in the coming years.',
      'category': 'Technology',
      'date': '2 days ago',
    },
    {
      'title': 'Optimizing App Performance',
      'summary':
          'Tips and tricks to make your Flutter apps run smoother and faster on all devices.',
      'category': 'Development',
      'date': '3 days ago',
    },
    {
      'title': 'Dark Mode Implementation Guide',
      'summary':
          'Step-by-step tutorial on implementing beautiful dark mode themes in your mobile applications.',
      'category': 'Design',
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
          // Header banner
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

          // News list
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
              // Thumbnail placeholder
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
                  // Replace with: ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset('assets/images/news_placeholder.png', fit: BoxFit.cover))
                ),
              ),
              const SizedBox(width: 16),

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category badge
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

                    // Title
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

                    // Summary
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

                    // Date
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
