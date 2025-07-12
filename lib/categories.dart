import 'package:flutter/material.dart';
import 'find_tutors.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'title': 'Mathematics',
      'description': 'From basic arithmetic to advanced calculus and statistics',
      'icon': Icons.calculate,
      'count': 1234,
      'rating': 4.8,
      'price': 35,
      'topics': ['Algebra', 'Geometry', 'Calculus'],
      'trending': true,
    },
    {
      'title': 'Science',
      'description': 'Physics, Chemistry, Biology and Earth Sciences',
      'icon': Icons.science,
      'count': 987,
      'rating': 4.7,
      'price': 40,
      'topics': ['Physics', 'Chemistry', 'Biology'],
      'trending': false,
    },
    {
      'title': 'Languages',
      'description': 'Learn new languages or improve existing skills',
      'icon': Icons.language,
      'count': 756,
      'rating': 4.9,
      'price': 25,
      'topics': ['English', 'Spanish', 'French'],
      'trending': true,
    },
    {
      'title': 'Programming',
      'description': 'Web development, mobile apps, and software engineering',
      'icon': Icons.computer,
      'count': 543,
      'rating': 4.8,
      'price': 50,
      'topics': ['Python', 'JavaScript', 'Java'],
      'trending': true,
    },
    {
      'title': 'Music',
      'description': 'Instruments, theory, composition and music production',
      'icon': Icons.music_note,
      'count': 432,
      'rating': 4.6,
      'price': 30,
      'topics': ['Piano', 'Guitar', 'Violin'],
      'trending': false,
    },
    {
      'title': 'Art & Design',
      'description': 'Visual arts, digital design, and creative expression',
      'icon': Icons.palette,
      'count': 321,
      'rating': 4.7,
      'price': 35,
      'topics': ['Drawing', 'Painting', 'Digital Art'],
      'trending': false,
    },
    {
      'title': 'Business',
      'description': 'Entrepreneurship, marketing, finance and management',
      'icon': Icons.business_center,
      'count': 298,
      'rating': 4.5,
      'price': 45,
      'topics': ['Marketing', 'Finance', 'Management'],
      'trending': true,
    },
    {
      'title': 'Test Prep',
      'description': 'SAT, ACT, GRE, GMAT and other standardized tests',
      'icon': Icons.assignment,
      'count': 445,
      'rating': 4.9,
      'price': 55,
      'topics': ['SAT', 'ACT', 'GRE'],
      'trending': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xFFE8F0FE),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.menu_book, color: Color(0xFF4285F4), size: 20),
                    SizedBox(width: 6),
                    Text('All Subjects', style: TextStyle(color: Color(0xFF4285F4), fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'Explore Learning\n',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Categories',
                    style: TextStyle(color: Color(0xFFFF9900), fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Discover expert tutors across all subjects and skills. From academic subjects to creative pursuits, find the perfect tutor for your learning journey.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            // Category cards
            ...categories.map((category) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CategoryCard(category: category),
            )),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Map<String, dynamic> category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final topics = category['topics'] as List<String>;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: const Color(0xFF6C63FF).withOpacity(0.12),
                  child: Icon(category['icon'], size: 32, color: const Color(0xFF6C63FF)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8,
                        children: [
                          Text(
                            category['title'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          if (category['trending'] == true)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Color(0xFF22C55E).withOpacity(0.12),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.trending_up, color: Color(0xFF22C55E), size: 16),
                                  SizedBox(width: 3),
                                  Text('Trending', style: TextStyle(color: Color(0xFF22C55E), fontWeight: FontWeight.bold, fontSize: 12)),
                                ],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        category['description'],
                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Icon(Icons.people, size: 18, color: Colors.orange[700]),
                const SizedBox(width: 4),
                Text('${category['count']} Tutors', style: const TextStyle(fontSize: 14, color: Colors.black)),
                const SizedBox(width: 16),
                Icon(Icons.star, size: 18, color: Colors.amber[700]),
                const SizedBox(width: 4),
                Text('${category['rating']}', style: const TextStyle(fontSize: 14, color: Colors.black)),
                const SizedBox(width: 16),
                Text('${category['price']}/hour', style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              children: [
                ...topics.take(3).map((t) => Chip(
                  label: Text(t, style: const TextStyle(fontSize: 13, color: Color(0xFF8A5C00))),
                  backgroundColor: const Color(0xFFFFF3CD),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  visualDensity: VisualDensity.compact,
                )),
                if (topics.length > 3)
                  Chip(
                    label: Text('+${topics.length - 3} more', style: const TextStyle(fontSize: 13, color: Color(0xFF8A5C00))),
                    backgroundColor: const Color(0xFFFFF3CD),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    visualDensity: VisualDensity.compact,
                  ),
              ],
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9900),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FindTutorsPage(categoryFilter: category['title']),
                    ),
                  );
                },
                child: const Text('Explore Tutors', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

