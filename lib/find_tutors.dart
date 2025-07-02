import 'package:flutter/material.dart';

class FindTutorsPage extends StatelessWidget {
  const FindTutorsPage({super.key});

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
                  text: 'Find Your Perfect ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(text: 'Tutor', style: TextStyle(color: Colors.orange)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Browse top-rated tutors across subjects and skills. Connect today to boost your learning journey.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search by subject or tutor name...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Tutor List
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return tutorCard(
                    name: 'John Doe',
                    subject: 'Mathematics',
                    rating: 4.8,
                    price: 35,
                    topics: ['Algebra', 'Geometry', 'Calculus'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tutorCard({
    required String name,
    required String subject,
    required double rating,
    required double price,
    required List<String> topics,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subject, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('by $name', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),

            // Ratings and Price
            Row(
              children: [
                const Icon(Icons.star, size: 16, color: Colors.orange),
                const SizedBox(width: 4),
                Text('$rating', style: const TextStyle(fontSize: 14)),
                const Spacer(),
                Text('\$$price/hour', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),

            const SizedBox(height: 10),

            // Topics
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: topics.map((topic) {
                return Chip(
                  label: Text(topic),
                  backgroundColor: Colors.orange[100],
                  labelStyle: const TextStyle(fontSize: 12),
                );
              }).toList(),
            ),

            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text('View Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
