import 'package:flutter/material.dart';
import 'booking_page.dart';

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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Header Section
            Card(
              elevation: 3,
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
                          Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(title, style: const TextStyle(color: Colors.grey)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.star, size: 16, color: Colors.orange),
                              const SizedBox(width: 4),
                              Text('$rating ($reviews reviews)'),
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

            // About Me
            const Text('About Me', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(about, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),

            // Specialties
            const Text('Specialties', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: specialties.map((topic) {
                return Chip(
                  label: Text(topic),
                  backgroundColor: Colors.orange[100],
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Languages
            const Text('Languages', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: languages.map((lang) {
                return Chip(
                  label: Text(lang),
                  backgroundColor: Colors.orange[100],
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Achievements
            const Text('Achievements & Qualifications', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              children: achievements.map((achieve) {
                return ListTile(
                  leading: const Icon(Icons.check_circle, color: Colors.orange),
                  title: Text(achieve),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Student Reviews
            const Text('Student Reviews', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              children: reviewsList.map((review) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.orange),
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

            const SizedBox(height: 20),

            // Book Session Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingPage(
                        tutorName: name,
                        subject: subject,
                        price: price,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Book Session'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
