import 'package:flutter/material.dart';
import 'booking_page.dart';
import 'tutor_profile.dart';
import 'wishlist_manager.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  void _bookAllTutors(BuildContext context) {
    final wishlistTutors = WishlistManager().wishlistTutors;
    for (var tutor in wishlistTutors) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BookingPage(
            tutorName: tutor['name'],
            subject: tutor['subject'],
            price: tutor['price'],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final wishlistTutors = WishlistManager().wishlistTutors;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: wishlistTutors.isEmpty
                ? const Center(
                    child: Text(
                      'No tutors in wishlist.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: wishlistTutors.length,
                    itemBuilder: (context, index) {
                      final tutor = wishlistTutors[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              ListTile(
                                leading: const CircleAvatar(
                                  backgroundColor: Colors.orangeAccent,
                                  child: Icon(Icons.person, color: Colors.white),
                                ),
                                title: Text(tutor['name']),
                                subtitle: Text(
                                  '${tutor['subject']} • ${tutor['rating']}⭐',
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('\$${tutor['price']}/hr'),
                                    IconButton(
                                      icon: const Icon(Icons.delete, color: Colors.red),
                                      tooltip: 'Remove from wishlist',
                                      onPressed: () {
                                        setState(() {
                                          WishlistManager().removeTutor(tutor);
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Removed from wishlist'),
                                            duration: Duration(seconds: 1),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => TutorProfilePage(
                                            name: tutor['name'],
                                            title: 'Expert ${tutor['subject']} Tutor',
                                            subject: tutor['subject'],
                                            rating: tutor['rating'],
                                            reviews: 120,
                                            price: tutor['price'],
                                            about:
                                                'Experienced tutor in ${tutor['subject']} with a proven track record.',
                                            specialties: [
                                              'Topic A',
                                              'Topic B',
                                              'Topic C',
                                            ],
                                            languages: ['English', 'Hindi'],
                                            achievements: ['Top Rated', 'Certified'],
                                            reviewsList: [
                                              {
                                                'name': 'User 1',
                                                'comment': 'Very helpful!',
                                                'rating': '5',
                                              },
                                              {
                                                'name': 'User 2',
                                                'comment': 'Great experience',
                                                'rating': '4',
                                              },
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[300],
                                    ),
                                    child: const Text(
                                      'View Profile',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => BookingPage(
                                            tutorName: tutor['name'],
                                            subject: tutor['subject'],
                                            price: tutor['price'],
                                          ),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                    ),
                                    child: const Text('Book Now'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: wishlistTutors.isEmpty ? null : () {
                  for (var tutor in wishlistTutors) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookingPage(
                          tutorName: tutor['name'],
                          subject: tutor['subject'],
                          price: tutor['price'],
                        ),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.shopping_cart_checkout),
                label: const Text('Book All'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
