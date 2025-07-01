import 'package:flutter/material.dart';

class FindTutorsPage extends StatelessWidget {
  const FindTutorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.menu_book, color: Colors.orange),
            const SizedBox(width: 8),
            const Text(
              'MediaCityTutorBooking',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Find Tutors',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          tutorCard(
            name: 'James Rodriguez',
            subject: 'Physics',
            price: 40,
            rating: 4.6,
            languages: 'English, Spanish',
            experience: 5,
            specialties: ['Mechanics', 'Thermodynamics', 'Quantum Physics'],
            isOnline: true,
          ),

          tutorCard(
            name: 'Maria Garcia',
            subject: 'Music',
            price: 30,
            rating: 4.9,
            languages: 'English, Spanish, Italian',
            experience: 15,
            specialties: ['Piano', 'Music Theory', 'Composition'],
            isOnline: false,
          ),

          tutorCard(
            name: 'Rahul Sharma',
            subject: 'Mathematics',
            price: 35,
            rating: 4.7,
            languages: 'English, Hindi',
            experience: 8,
            specialties: ['Algebra', 'Calculus', 'Geometry'],
            isOnline: true,
          ),

          tutorCard(
            name: 'Emma Wilson',
            subject: 'Programming',
            price: 50,
            rating: 4.8,
            languages: 'English',
            experience: 6,
            specialties: ['Python', 'JavaScript', 'Java'],
            isOnline: false,
          ),
        ],
      ),
    );
  }

  Widget tutorCard({
    required String name,
    required String subject,
    required double price,
    required double rating,
    required String languages,
    required int experience,
    required List<String> specialties,
    required bool isOnline,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, color: Colors.grey[700]),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(subject, style: const TextStyle(color: Colors.orange)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isOnline ? Colors.green : Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(isOnline ? 'Online' : 'Offline', style: const TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              children: specialties.map((s) => Chip(label: Text(s))).toList(),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 18),
                const SizedBox(width: 4),
                Text('$rating / 5.0', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 16),
                Icon(Icons.school, size: 18),
                const SizedBox(width: 4),
                Text('$experience yrs experience'),
              ],
            ),
            const SizedBox(height: 8),
            Text('Languages: $languages'),
            const SizedBox(height: 8),
            Text('\$$price/hour', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
