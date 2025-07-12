import 'package:flutter/material.dart';
import 'about.dart';
import 'contact.dart';
import 'wishlist_page.dart';
import 'language_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _selectedLocation = 'New York, NY';
  final List<String> _locations = [
    'New York, NY',
    'San Francisco, CA',
    'London, UK',
    'Delhi, India',
    'Tokyo, Japan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.orange,
                        child: Icon(Icons.person, size: 60, color: Colors.white),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.edit, color: Colors.orange, size: 20),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Sushil ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '+91 6376032704',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const Text(
                    'xyzemail@gmail.com',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, size: 18),
                        label: const Text('Edit Profile'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[100],
                          foregroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.logout, size: 18),
                        label: const Text('Log Out'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[100],
                          foregroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Content', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            _profileTile(context, Icons.favorite_border, 'Wishlist', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const WishlistPage()));
            }),
            _profileTile(context, Icons.notifications_none, 'Notification', () {
              // Notification page navigation
            }),
            _profileTile(context, Icons.info_outline, 'About App', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage()));
            }),
            _profileTile(context, Icons.phone, 'Contact Support', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ContactUsPage()));
            }),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Preference', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            _profileTile(context, Icons.language, 'Language', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const LanguagePage()));
            }),
            _profileTile(context, Icons.location_on, 'Location', () async {
              String tempLocation = _selectedLocation;
              String? newLocation = await showDialog<String>(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setStateDialog) {
                      return AlertDialog(
                        title: const Text('Select Location'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ..._locations.map((loc) => RadioListTile<String>(
                                  title: Text(loc),
                                  value: loc,
                                  groupValue: tempLocation,
                                  onChanged: (value) {
                                    setStateDialog(() {
                                      tempLocation = value!;
                                    });
                                  },
                                )),
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
                              Navigator.pop(context, tempLocation);
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
              if (newLocation != null && newLocation != _selectedLocation) {
                setState(() {
                  _selectedLocation = newLocation;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Location set to $_selectedLocation')),
                );
              }
            }),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _profileTile(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Icon(icon, color: Colors.orange),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: onTap,
        ),
      ),
    );
  }
}
