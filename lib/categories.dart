import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  text: 'Explore Learning ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(text: 'Categories', style: TextStyle(color: Colors.orange)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Discover expert tutors across all subjects and skills. From academic subjects to creative pursuits, find the perfect tutor for your learning journey.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search categories...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Category Grid
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  categoryCard('Mathematics', 'From basic arithmetic to advanced calculus', Icons.calculate, 'Trending'),
                  categoryCard('Science', 'Physics, Chemistry, Biology and Earth Sciences', Icons.science, 'Trending'),
                  categoryCard('Languages', 'Learn new languages or improve existing skills', Icons.language, 'Trending'),
                  categoryCard('Programming', 'Web, mobile apps, software engineering', Icons.computer, 'Trending'),
                  categoryCard('Music', 'Master instruments or vocal skills', Icons.music_note, ''),
                  categoryCard('Art & Design', 'Unlock your creative potential', Icons.palette, ''),
                  categoryCard('Business', 'Entrepreneurship and business skills', Icons.work, 'Trending'),
                  categoryCard('Test Prep', 'Prepare for standardized tests', Icons.assignment, 'Trending'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryCard(String title, String description, IconData icon, String tag) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            if (tag.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.green[100], borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.trending_up, size: 16, color: Colors.green),
                    SizedBox(width: 4),
                    Text('Trending', style: TextStyle(fontSize: 12, color: Colors.green)),
                  ],
                ),
              ),
            const SizedBox(height: 10),
            Icon(icon, size: 40, color: Colors.orange),
            const SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Expanded(
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('Explore Tutors', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}
