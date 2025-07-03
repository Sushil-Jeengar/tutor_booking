import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'sign_up.dart';
import 'about.dart';
import 'contact.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.orange.shade100,
                child: const Icon(Icons.person, color: Colors.orange, size: 50),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to MediaCityTutorBooking!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              profileOption(context, 'Sign In', Icons.login, SignInPage()),
              profileOption(context, 'Get Started', Icons.app_registration, SignUpPage()),
              profileOption(context, 'About', Icons.info_outline, AboutPage()),
              profileOption(context, 'Contact Us', Icons.phone, ContactUsPage()),

            ],
          ),
        ),
      ),
    );
  }

  Widget profileOption(BuildContext context, String text, IconData icon, Widget page) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
      ),
    );
  }
}
