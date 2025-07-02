import 'package:flutter/material.dart';
import 'find_tutors.dart';
import 'categories.dart';
import 'about.dart';
import 'contact.dart';// Ensure this file exists and is configured properly

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutor Booking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      routes: {
        '/tutors': (context) => const FindTutorsPage(),
        '/categories': (context) => const CategoriesPage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => ContactUsPage(), // ✅ Categories route added
        // Add routes for about, contact later
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController1 = TextEditingController();
    final TextEditingController searchController2 = TextEditingController();

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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  navButton(context, 'Tutors', () {
                    Navigator.pushNamed(context, '/tutors');
                  }),
                  navButton(context, 'Categories', () {
                    Navigator.pushNamed(context, '/categories');
                  }),
                  navButton(context, 'About', () {
                    Navigator.pushNamed(context, '/about');
                  }),

                  navButton(context, 'Contact Us', () {
                    Navigator.pushNamed(context, '/contact');

                    }),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text(
                    'Over 10,000+ Happy Students',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              RichText(
                text: const TextSpan(
                  text: 'Find Your ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(text: 'Dream Tutor ', style: TextStyle(color: Colors.orange)),
                    TextSpan(text: 'Today'),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              Text(
                'Connect with world-class tutors who will transform your learning journey. Start achieving your goals today!',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),

              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return Row(
                      children: [
                        Expanded(child: searchField(searchController1, 'Subject')),
                        const SizedBox(width: 10),
                        Expanded(child: searchField(searchController2, 'Tutor Name')),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                          child: const Text('Find Perfect Tutor'),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        searchField(searchController1, 'Subject'),
                        const SizedBox(height: 10),
                        searchField(searchController2, 'Tutor Name'),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                          child: const Text('Find Perfect Tutor'),
                        ),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  statCard('10K+', 'Students'),
                  statCard('2K+', 'Tutors'),
                  statCard('50+', 'Subjects'),
                ],
              ),
              const SizedBox(height: 20),

              Column(
                children: [
                  featureCard(Icons.video_library, 'Video Lessons', 'HD Quality'),
                  const SizedBox(height: 10),
                  featureCard(Icons.chat, 'Chat Support', '24/7 Available'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget statCard(String title, String subtitle) {
    return Card(
      child: Container(
        width: 90,
        height: 70,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(subtitle, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }

  Widget featureCard(IconData icon, String title, String subtitle) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }

  Widget navButton(BuildContext context, String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
