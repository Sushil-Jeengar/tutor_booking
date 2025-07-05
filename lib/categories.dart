import 'package:flutter/material.dart';
import 'find_tutors.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'title': 'Mathematics',
      'description': 'From basic arithmetic to advanced calculus',
      'icon': Icons.calculate,
      'tag': 'Trending'
    },
    {
      'title': 'Science',
      'description': 'Physics, Chemistry, Biology and more',
      'icon': Icons.science,
      'tag': 'Trending'
    },
    {
      'title': 'Languages',
      'description': 'Learn new languages or improve skills',
      'icon': Icons.language,
      'tag': 'Trending'
    },
    {
      'title': 'Programming',
      'description': 'Web, mobile apps, software engineering',
      'icon': Icons.computer,
      'tag': 'Trending'
    },
    {
      'title': 'Music',
      'description': 'Master instruments or vocal skills',
      'icon': Icons.music_note,
      'tag': ''
    },
    {
      'title': 'Art & Design',
      'description': 'Unlock your creative potential',
      'icon': Icons.palette,
      'tag': ''
    },
    {
      'title': 'Business',
      'description': 'Entrepreneurship and business skills',
      'icon': Icons.work,
      'tag': 'Trending'
    },
    {
      'title': 'Test Prep',
      'description': 'Prepare for competitive exams',
      'icon': Icons.assignment,
      'tag': 'Trending'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Explore Learning ',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(text: 'Categories', style: TextStyle(color: Colors.orange)),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Discover expert tutors across subjects and skills.',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Category Grid
              Expanded(
                child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return categoryCard(
                      context,
                      category['title'],
                      category['description'],
                      category['icon'],
                      category['tag'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryCard(BuildContext context, String title, String description, IconData icon, String tag) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FindTutorsPage(categoryFilter: title)),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (tag.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.trending_up, size: 14, color: Colors.green),
                      SizedBox(width: 4),
                      Text('Trending', style: TextStyle(fontSize: 12, color: Colors.green)),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.orange.withOpacity(0.2),
                child: Icon(icon, size: 28, color: Colors.orange),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
