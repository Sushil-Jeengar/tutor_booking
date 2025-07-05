import 'package:flutter/material.dart';

class TutorProfilePage extends StatelessWidget {
  final String name;
  final String title;
  final String subject;
  final double rating;
  final int reviews;
  final double price;
  final String about;
  final List<String> specialties;
  final List<String> languages;
  final List<String> achievements;
  final List<Map<String, String>> reviewsList;

  const TutorProfilePage({
    super.key,
    required this.name,
    required this.title,
    required this.subject,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.about,
    required this.specialties,
    required this.languages,
    required this.achievements,
    required this.reviewsList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Tutor Profile', style: TextStyle(color: Colors.orange)),
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Header Section
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.person, size: 40, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(title, style: const TextStyle(color: Colors.grey)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.star, size: 18, color: Colors.orange),
                              const SizedBox(width: 4),
                              Text('$rating', style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(' ($reviews reviews)', style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // About Me Section
            sectionTitle('About Me'),
            sectionCard(Text(about, style: const TextStyle(fontSize: 16, color: Colors.black87))),
            const SizedBox(height: 20),

            // Specialties
            sectionTitle('Specialties'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: specialties.map((topic) {
                return Chip(
                  label: Text(topic),
                  backgroundColor: Colors.orange[100],
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Languages
            sectionTitle('Languages'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: languages.map((lang) {
                return Chip(
                  label: Text(lang),
                  backgroundColor: Colors.orange[100],
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Achievements
            sectionTitle('Achievements & Qualifications'),
            sectionCard(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: achievements.map((achieve) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle, color: Colors.orange, size: 20),
                        const SizedBox(width: 8),
                        Expanded(child: Text(achieve)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            // Student Reviews
            sectionTitle('Student Reviews'),
            Column(
              children: reviewsList.map((review) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(review['name']!),
                    subtitle: Text(review['comment']!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        5,
                            (index) => Icon(
                          index < int.parse(review['rating']!) ? Icons.star : Icons.star_border,
                          color: Colors.orange,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            // Book Session Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.calendar_today),
                label: const Text('Book Session'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Title
  Widget sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  // Reusable Card Wrapper
  Widget sectionCard(Widget child) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.only(top: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: child,
      ),
    );
  }
}
