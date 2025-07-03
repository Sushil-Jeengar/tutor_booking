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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.orange,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Welcome to Your Profile',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
            ),
            const SizedBox(height: 40),
            ListTile(
              leading: const Icon(Icons.login, color: Colors.orange),
              title: const Text('Sign In'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SignInPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.app_registration, color: Colors.orange),
              title: const Text('Sign Up'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.orange),
              title: const Text('About Us'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.orange),
              title: const Text('Contact Us'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ContactUsPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
