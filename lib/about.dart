import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.menu_book, color: Colors.orange),
                  SizedBox(width: 8),
                  Text(
                    'MediaCityTutorBooking',
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Home', style: TextStyle(color: Colors.black)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Find Tutors', style: TextStyle(color: Colors.black)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Categories', style: TextStyle(color: Colors.black)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('About', style: TextStyle(color: Colors.orange)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Contact', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite, color: Colors.orange),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.orange),
                    onPressed: () {},
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Sign In', style: TextStyle(color: Colors.orange)),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: Text('Get Started'),
                  ),
                ],
              ),
            ],
          ),
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
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.orange.withAlpha(25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Our Story',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                  SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
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
                  SizedBox(height: 10),
                  Text(
                    'We believe that every student deserves access to quality education. Our mission is to connect learners with passionate tutors who can unlock their full potential and help them achieve their dreams.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                statCard(Icons.people, '50K+', 'Students Helped'),
                statCard(Icons.star, '5K+', 'Expert Tutors'),
                statCard(Icons.book, '100+', 'Subjects Covered'),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Our Mission',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'To democratize access to quality education by creating a platform where passionate tutors and eager learners can connect seamlessly. We strive to make learning personalized, accessible, and effective for everyone, regardless of their background or location.',
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 20),
                  missionPoint('Personalized learning experiences for every student'),
                  missionPoint('Verified and qualified tutors from around the world'),
                  missionPoint('Affordable pricing with flexible payment options'),
                  missionPoint('24/7 support and safety measures'),
                ],
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Our Core Values',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'These principles guide everything we do and shape the experience we create for our community.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                valueCard(Icons.track_changes, 'Excellence', 'We strive for the highest quality in everything we do, from tutor selection to platform features.'),
                valueCard(Icons.favorite, 'Passion', 'We\'re passionate about education and believe in the transformative power of learning.'),
                valueCard(Icons.shield, 'Trust', 'We build trust through transparency, safety measures, and reliable service delivery.'),
                valueCard(Icons.language, 'Accessibility', 'We make quality education accessible to learners everywhere, breaking down barriers.'),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Meet Our Team',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'The passionate individuals behind MediaCityTutorBooking who work tirelessly to make education accessible to all.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                teamCard('Sarah Johnson', 'CEO & Founder'),
                teamCard('Michael Chen', 'CTO'),
                teamCard('Emily Davis', 'Head of Education'),
                teamCard('David Wilson', 'Head of Operations'),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget statCard(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        Icon(icon, color: Colors.orange, size: 36),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(subtitle, style: TextStyle(color: Colors.black54)),
      ],
    );
  }

  Widget missionPoint(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget valueCard(IconData icon, String title, String description) {
    return SizedBox(
      width: 150,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Icon(icon, size: 36, color: Colors.orange),
              SizedBox(height: 10),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black54),
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
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              CircleAvatar(radius: 30, backgroundColor: Colors.grey),
              SizedBox(height: 10),
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(role, style: TextStyle(color: Colors.orange)),
            ],
          ),
        ),
      ),
    );
  }
}
