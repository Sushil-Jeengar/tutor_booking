import 'package:flutter/material.dart';
import 'about.dart';
import 'contact.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Your Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Here you can manage your account details.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // About App
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.orange),
                title: const Text('About App'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            // Contact Support
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.orange),
                title: const Text('Contact Support'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactUsPage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            // Language Change
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: ListTile(
                leading: const Icon(Icons.language, color: Colors.orange),
                title: const Text('Change Language'),
                onTap: () {
                  _showLanguageDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    String selectedLanguage = 'English';
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Select Language'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: const Text('English'),
                    value: 'English',
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Hindi'),
                    value: 'Hindi',
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Spanish'),
                    value: 'Spanish',
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    // You can save selectedLanguage to shared preferences or state management
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Language set to $selectedLanguage')),
                    );
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
