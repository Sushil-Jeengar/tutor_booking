import 'package:flutter/material.dart';
import 'tutor_profile.dart'; // Replace with your actual profile page file name

class FindTutorsPage extends StatelessWidget {
  const FindTutorsPage({super.key});

  final List<Map<String, dynamic>> tutors = const [
    {
      'name': 'John Doe',
      'subject': 'Mathematics',
      'rating': 4.8,
      'price': 35.0,
      'topics': ['Algebra', 'Geometry', 'Calculus'],
    },
    {
      'name': 'Emily Smith',
      'subject': 'Physics',
      'rating': 4.6,
      'price': 40.0,
      'topics': ['Mechanics', 'Thermodynamics', 'Optics'],
    },
    {
      'name': 'David Johnson',
      'subject': 'Chemistry',
      'rating': 4.7,
      'price': 38.0,
      'topics': ['Organic', 'Inorganic', 'Physical'],
    },
    {
      'name': 'Sarah Lee',
      'subject': 'English',
      'rating': 4.9,
      'price': 30.0,
      'topics': ['Grammar', 'Writing', 'Literature'],
    },
    {
      'name': 'Michael Brown',
      'subject': 'Computer Science',
      'rating': 4.5,
      'price': 45.0,
      'topics': ['Python', 'Data Structures', 'Algorithms'],
    },
  ];

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

              ListView.builder(
                itemCount: tutors.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final tutor = tutors[index];
                  return tutorCard(
                    context: context,
                    name: tutor['name'],
                    subject: tutor['subject'],
                    rating: tutor['rating'],
                    price: tutor['price'],
                    topics: List<String>.from(tutor['topics']),
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
    required BuildContext context,
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TutorProfilePage(
                        name: name,
                        title: '$subject Expert',
                        subject: subject,
                        rating: rating,
                        reviews: 100, // You can adjust this as needed
                        price: price,
                        about: 'Passionate about teaching $subject with interactive methods.',
                        specialties: topics,
                        languages: ['English'],
                        achievements: [
                          'Certified $subject Tutor',
                          '5+ years of teaching experience',
                          'Fluent in English',
                        ],
                        reviewsList: [
                          {
                            'name': 'Student A',
                            'comment': '$name is an excellent tutor!',
                            'rating': '5',
                          },
                        ],
                      ),
                    ),
                  );
                },
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
