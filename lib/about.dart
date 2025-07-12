import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.menu_book, color: Colors.orange),
            SizedBox(width: 8),
            Text(
              'MediaCityTutorBooking',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.withAlpha(25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Our Story',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Transforming Education\n',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'One Student at a Time',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'We believe that every student deserves access to quality education. Our mission is to connect learners with passionate tutors who can unlock their full potential and help them achieve their dreams.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                statCard(Icons.person, '50K+', 'Students Helped'),
                statCard(Icons.workspace_premium, '5K+', 'Expert Tutors'),
                statCard(Icons.menu_book, '100+', 'Subjects Covered'),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Our Mission',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'To democratize access to quality education by creating a platform where passionate tutors and eager learners can connect seamlessly. We strive to make learning personalized, accessible, and effective for everyone, regardless of their background or location.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                missionPoint(
                  'Personalized learning experiences for every student',
                ),
                missionPoint(
                  'Verified and qualified tutors from around the world',
                ),
                missionPoint(
                  'Affordable pricing with flexible payment options',
                ),
                missionPoint('24/7 support and safety measures'),
              ],
            ),

            const SizedBox(height: 30),

            const Center(
              child: Text(
                'Our Core Values',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'These principles guide everything we do and shape the experience we create for our community.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  valueCard(
                    Icons.track_changes,
                    'Excellence',
                    'We strive for the highest quality in everything we do, from tutor selection to platform features.',
                    context,
                  ),
                  valueCard(
                    Icons.favorite,
                    'Passion',
                    'We\'re passionate about education and believe in the transformative power of learning.',
                    context,
                  ),
                  valueCard(
                    Icons.shield,
                    'Trust',
                    'We build trust through transparency, safety measures, and reliable service delivery.',
                    context,
                  ),
                  valueCard(
                    Icons.language,
                    'Accessibility',
                    'We make quality education accessible to learners everywhere, breaking down barriers.',
                    context,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Center(
              child: Text(
                'Meet Our Team',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'The passionate individuals behind MediaCityTutorBooking who work tirelessly to make education accessible to all.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  teamCard('Sarah Johnson', 'CEO & Founder'),
                  teamCard('Michael Chen', 'CTO'),
                  teamCard('Emily Davis', 'Head of Education'),
                  teamCard('David Wilson', 'Head of Operations'),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget statCard(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        Icon(icon, color: Colors.orange, size: 36),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(subtitle, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }

  Widget missionPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget valueCard(
    IconData icon,
    String title,
    String description,
    BuildContext context,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth > 600
        ? (screenWidth / 2) - 40
        : (screenWidth / 2) - 30;

    return SizedBox(
      width: cardWidth,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Icon(icon, size: 36, color: Colors.orange),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget teamCard(String name, String role) {
    return SizedBox(
      width: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const CircleAvatar(radius: 30, backgroundColor: Colors.grey),
              const SizedBox(height: 10),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(role, style: const TextStyle(color: Colors.orange)),
            ],
          ),
        ),
      ),
    );
  }
}
