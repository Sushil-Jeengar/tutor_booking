import 'package:flutter/material.dart';
import 'tutor_profile.dart';
import 'booking_page.dart';

class FindTutorsPage extends StatefulWidget {
  final String? categoryFilter;

  const FindTutorsPage({super.key, this.categoryFilter});

  @override
  State<FindTutorsPage> createState() => _FindTutorsPageState();
}

class _FindTutorsPageState extends State<FindTutorsPage> {
  final List<Map<String, dynamic>> allTutors = const [
    // Mathematics Tutors
    {
      'name': 'John Doe',
      'subject': 'Mathematics',
      'rating': 4.8,
      'price': 35.0,
      'topics': ['Algebra', 'Geometry', 'Calculus'],
    },
    {
      'name': 'Priya Sharma',
      'subject': 'Mathematics',
      'rating': 4.7,
      'price': 30.0,
      'topics': ['Trigonometry', 'Statistics', 'Probability'],
    },

    // Science Tutors
    {
      'name': 'Emily Smith',
      'subject': 'Science',
      'rating': 4.6,
      'price': 40.0,
      'topics': ['Physics', 'Chemistry', 'Biology'],
    },
    {
      'name': 'David Johnson',
      'subject': 'Science',
      'rating': 4.7,
      'price': 38.0,
      'topics': ['Earth Science', 'Physics', 'Chemistry'],
    },

    // Languages Tutors
    {
      'name': 'Sarah Lee',
      'subject': 'Languages',
      'rating': 4.9,
      'price': 30.0,
      'topics': ['English', 'French', 'Spanish'],
    },
    {
      'name': 'Carlos Rivera',
      'subject': 'Languages',
      'rating': 4.5,
      'price': 28.0,
      'topics': ['Spanish', 'Portuguese', 'English'],
    },

    // Programming Tutors
    {
      'name': 'Michael Brown',
      'subject': 'Programming',
      'rating': 4.5,
      'price': 45.0,
      'topics': ['Python', 'Data Structures', 'Algorithms'],
    },
    {
      'name': 'Ananya Gupta',
      'subject': 'Programming',
      'rating': 4.8,
      'price': 50.0,
      'topics': ['Flutter', 'Web Development', 'C++'],
    },

    // Music Tutors
    {
      'name': 'Liam Turner',
      'subject': 'Music',
      'rating': 4.7,
      'price': 35.0,
      'topics': ['Guitar', 'Piano', 'Vocals'],
    },
    {
      'name': 'Aarav Mehta',
      'subject': 'Music',
      'rating': 4.6,
      'price': 32.0,
      'topics': ['Tabla', 'Harmonium', 'Classical Singing'],
    },

    // Art & Design Tutors
    {
      'name': 'Olivia Wilson',
      'subject': 'Art & Design',
      'rating': 4.8,
      'price': 40.0,
      'topics': ['Drawing', 'Graphic Design', 'Painting'],
    },
    {
      'name': 'Riya Kapoor',
      'subject': 'Art & Design',
      'rating': 4.9,
      'price': 42.0,
      'topics': ['Sketching', 'Digital Illustration', '3D Art'],
    },

    // Business Tutors
    {
      'name': 'James Carter',
      'subject': 'Business',
      'rating': 4.7,
      'price': 50.0,
      'topics': ['Entrepreneurship', 'Marketing', 'Finance'],
    },
    {
      'name': 'Sneha Nair',
      'subject': 'Business',
      'rating': 4.6,
      'price': 48.0,
      'topics': ['Business Strategy', 'Leadership', 'Economics'],
    },

    // Test Prep Tutors
    {
      'name': 'William Smith',
      'subject': 'Test Prep',
      'rating': 4.9,
      'price': 55.0,
      'topics': ['SAT', 'GRE', 'TOEFL'],
    },
    {
      'name': 'Pooja Desai',
      'subject': 'Test Prep',
      'rating': 4.8,
      'price': 52.0,
      'topics': ['IELTS', 'GMAT', 'CAT'],
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredTutors = allTutors.where((tutor) {
      final matchesCategory = widget.categoryFilter == null ||
          tutor['subject'].toString().toLowerCase().contains(widget.categoryFilter!.toLowerCase());

      final matchesSearch = tutor['name'].toString().toLowerCase().contains(searchQuery.toLowerCase()) ||
          tutor['subject'].toString().toLowerCase().contains(searchQuery.toLowerCase());

      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.categoryFilter != null ? '${widget.categoryFilter} Tutors' : 'Find Tutors',
          style: const TextStyle(color: Colors.orange),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search by subject or tutor name...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              if (filteredTutors.isEmpty)
                const Center(
                  child: Text(
                    'No tutors found.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              else
                ListView.builder(
                  itemCount: filteredTutors.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final tutor = filteredTutors[index];
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
            Row(
              children: [
                Expanded(
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
                            reviews: 100,
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
                const SizedBox(width: 10),
                Expanded(
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
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    child: const Text('Book Session'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
