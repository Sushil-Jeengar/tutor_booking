import 'package:flutter/material.dart';
import 'find_tutors.dart';
import 'categories.dart';
import 'about.dart';
import 'contact.dart';

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
      home: const BottomNavWrapper(),
    );
  }
}

class BottomNavWrapper extends StatefulWidget {
  const BottomNavWrapper({super.key});

  @override
  State<BottomNavWrapper> createState() => _BottomNavWrapperState();
}

class _BottomNavWrapperState extends State<BottomNavWrapper> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const FindTutorsPage(),
    const CategoriesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleMenuSelection(String choice) {
    if (choice == 'Sign In') {
      // Add Sign In navigation logic
    } else if (choice == 'Sign Up') {
      // Add Sign Up navigation logic
    } else if (choice == 'About') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
    } else if (choice == 'Contact Us') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()));
    }
  }

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
            const Text('MediaCityTutorBooking', style: TextStyle(color: Colors.orange)),
            const Spacer(),
            PopupMenuButton<String>(
              icon: const Icon(Icons.person, color: Colors.orange),
              onSelected: _handleMenuSelection,
              itemBuilder: (BuildContext context) {
                return ['Sign In', 'Sign Up', 'About', 'Contact Us'].map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Tutors'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController1 = TextEditingController();
    final TextEditingController searchController2 = TextEditingController();

    return SingleChildScrollView(
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
}
