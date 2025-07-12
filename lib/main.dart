import 'package:flutter/material.dart';
import 'find_tutors.dart';
import 'categories.dart';
import 'profile.dart';
import 'splash_screen.dart';
import 'booking_page.dart';
import 'otp_login.dart';
import 'tutor_profile.dart';
import 'wishlist_page.dart';
import 'wishlist_manager.dart';

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
      home: const SplashScreen(),
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
  final WishlistManager _wishlistManager = WishlistManager();

  final List<Widget> _pages = [
    const HomePage(),
    const FindTutorsPage(),
    const CategoriesPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _wishlistManager.addListener(_onWishlistChanged);
  }

  @override
  void dispose() {
    _wishlistManager.removeListener(_onWishlistChanged);
    super.dispose();
  }

  void _onWishlistChanged() {
    setState(() {
      // Trigger rebuild when wishlist changes
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF7ED),
        elevation: 0,
        title: _selectedIndex == 0
            ? Row(
                children: const [
                  Icon(Icons.menu_book, color: Colors.orange),
                  SizedBox(width: 8),

                ],
              )
            : const Icon(Icons.menu_book, color: Colors.orange),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite, color: Colors.orange),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const WishlistPage()),
                  );
                },
              ),
              if (_wishlistManager.wishlistCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${_wishlistManager.wishlistCount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),

          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.orange),
            onPressed: () {
              // Notification action can be implemented later
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Tutors'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Map<String, dynamic>> testimonials = const [
    {
      'name': 'Natalie Martinez',
      'role': 'Student, Common Entrance',
      'comment': 'Excellent experience! My tutor was very helpful and patient.',
    },
    {
      'name': 'Samantha Johnson',
      'role': 'Student, High School Math',
      'comment':
          'Found the perfect math tutor who really understood my learning needs.',
    },
    {
      'name': 'Isabella Rodriguez',
      'role': 'Student, Science Stream',
      'comment':
          'A perfect match for students like me. Highly recommended platform!',
    },
    {
      'name': 'John Peter',
      'role': 'Parent, Grade 6',
      'comment':
          'My child loves this tutor! Very professional and result-oriented.',
    },
  ];

  final List<Map<String, dynamic>> tutors = const [
    {
      'name': 'Sarah Johnson',
      'subject': 'Mathematics Expert',
      'status': 'Online',
      'rating': 4.9,
      'reviews': 127,
      'price': 25.0,
      'distance': '0.5',
    },
    {
      'name': 'Dr. Mike Chen',
      'subject': 'Physics Specialist',
      'status': 'Offline',
      'rating': 4.8,
      'reviews': 89,
      'price': 35.0,
      'distance': '0.8',
    },
    {
      'name': 'Emma Wilson',
      'subject': 'Language Tutor',
      'status': 'Online',
      'rating': 5.0,
      'reviews': 156,
      'price': 20.0,
      'distance': '1.2',
    },
    {
      'name': 'Prof. Lisa Brown',
      'subject': 'Chemistry Expert',
      'status': 'Online',
      'rating': 4.9,
      'reviews': 203,
      'price': 40.0,
      'distance': '1.5',
    },
  ];

  final List<Map<String, dynamic>> categories = const [
    {'title': 'Mathematics', 'icon': Icons.calculate, 'count': 1234},
    {'title': 'Science', 'icon': Icons.science, 'count': 987},
    {'title': 'Languages', 'icon': Icons.language, 'count': 756},
    {'title': 'Programming', 'icon': Icons.computer, 'count': 543},
    {'title': 'Music', 'icon': Icons.music_note, 'count': 432},
    {'title': 'Art & Design', 'icon': Icons.palette, 'count': 321},
    {'title': 'Business', 'icon': Icons.work, 'count': 210},
    {'title': 'Test Prep', 'icon': Icons.assignment, 'count': 180},
  ];

  Widget testimonialCard(String name, String role, String comment) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.format_quote, color: Colors.orange, size: 30),
              const SizedBox(height: 8),
              Text(comment, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 12),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(role, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget tutorCard(
    BuildContext context,
    String name,
    String subject,
    String status,
    double rating,
    int reviews,
    double price,
    String distance,
  ) {
    final isOnline = status == 'Online';
    final tutor = {
      'name': name,
      'subject': subject,
      'rating': rating,
      'price': price,
      'topics': [subject], // Using subject as a topic for consistency
    };
    final isWishlisted = WishlistManager().wishlistTutors.any((t) => t['name'] == name && t['subject'] == subject);
    
    void toggleWishlist() {
      setState(() {
        if (isWishlisted) {
          WishlistManager().removeTutor(tutor);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Removed from wishlist'), duration: Duration(seconds: 1)),
          );
        } else {
          WishlistManager().addTutor(tutor);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Added to wishlist'), duration: Duration(seconds: 1)),
          );
        }
      });
    }
    
    return Container(
      width: 270,
      margin: const EdgeInsets.only(right: 20),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top bar: status badge and heart icon
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: isOnline ? const Color(0xFF22C55E) : const Color(0xFF9CA3AF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      status,
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        isWishlisted ? Icons.favorite : Icons.favorite_border,
                        color: isWishlisted ? Colors.orange : const Color(0xFF9CA3AF),
                      ),
                      onPressed: toggleWishlist,
                      iconSize: 22,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
            // Image placeholder
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Center(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person, size: 36, color: Color(0xFFBDBDBD)),
                ),
              ),
            ),
            // Name and subject
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subject,
                    style: const TextStyle(color: Color(0xFFFF9900), fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            // Rating and reviews
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 16, right: 16),
              child: Row(
                children: [
                  ...List.generate(5, (i) => Icon(
                    i < rating.round()
                        ? Icons.star
                        : Icons.star_border,
                    color: const Color(0xFFFFC107),
                    size: 16,
                  )),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(width: 2),
                  Text('($reviews reviews)', style: const TextStyle(color: Colors.grey, fontSize: 11)),
                ],
              ),
            ),
            // Price and distance
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 16, right: 16),
              child: Row(
                children: [
                  Text(
                    '\$${price.toStringAsFixed(0)}/hour',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3CD),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on, color: Color(0xFFFF9900), size: 14),
                        const SizedBox(width: 2),
                        Text('$distance mi', style: const TextStyle(color: Color(0xFF8A5C00), fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Book Session button
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFA726), Color(0xFFFF9900)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text('Book Session', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget homeCategoryCard(BuildContext context, String title, IconData icon, int count) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 14),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FindTutorsPage(categoryFilter: title),
            ),
          );
        },
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: const Color(0xFF6C63FF).withOpacity(0.12),
                  child: Icon(icon, size: 32, color: const Color(0xFF6C63FF)),
                ),
                const SizedBox(height: 14),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  '${count.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (Match m) => "${m[1]},")} tutors',
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
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
        fillColor: Colors.white,
        filled: true,
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
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
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

  @override
  Widget build(BuildContext context) {
    final searchController1 = TextEditingController();
    final searchController2 = TextEditingController();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
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
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Dream Tutor ',
                    style: TextStyle(color: Colors.orange),
                  ),
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
                      Expanded(
                        child: searchField(searchController1, 'Subject'),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: searchField(searchController2, 'Tutor Name'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
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
            const SizedBox(height: 20),
            // Add heading and subtitle for Nearest Tutors
            const SizedBox(height: 30),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.orange, size: 18),
                      SizedBox(width: 4),
                      Text('Location Based', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            RichText(
              text: const TextSpan(
                text: 'Discover Amazing Tutors\n',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.2,
                ),
                children: [
                  TextSpan(
                    text: 'Right Near You',
                    style: TextStyle(color: Colors.orange, fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Connect with qualified tutors in your neighborhood who are ready to help you achieve your learning goals.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 30),
            const Text(
              'Nearest Tutors',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 360,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tutors.length,
                itemBuilder: (context, index) {
                  final tutor = tutors[index];
                  return tutorCard(
                    context,
                    tutor['name'],
                    tutor['subject'],
                    tutor['status'],
                    tutor['rating'].toDouble(),
                    tutor['reviews'],
                    tutor['price'].toDouble(),
                    tutor['distance'],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Popular Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Browse by subject and find the perfect tutor for your needs.',
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return homeCategoryCard(
                    context,
                    category['title'],
                    category['icon'],
                    category['count'],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'What Our Students Say',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: testimonials.length,
                itemBuilder: (context, index) {
                  final t = testimonials[index];
                  return testimonialCard(t['name'], t['role'], t['comment']);
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Featured Tutors',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // New Featured Tutors Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Meet Our',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Featured Tutors',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB16CEA),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Learn from the best! Our featured tutors have helped thousands of students achieve their academic goals.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      FeaturedTutorCard(
                        name: 'Dr. Michael Chen',
                        specialty: 'Physics & Engineering',
                        badge: 'PhD MIT',
                        badgeType: 'PhD MIT',
                        rating: 5.0,
                        reviews: 89,
                        students: '500+',
                        price: '45',
                        onBook: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingPage(
                                tutorName: 'Dr. Michael Chen',
                                subject: 'Physics & Engineering',
                                price: 45.0,
                              ),
                            ),
                          );
                        },
                        onProfile: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TutorProfilePage(
                                name: 'Dr. Michael Chen',
                                title: 'Physics & Engineering',
                                subject: 'Physics & Engineering',
                                rating: 5.0,
                                reviews: 89,
                                price: 45.0,
                                about: 'PhD from MIT. Expert in Physics and Engineering.',
                                specialties: ['Quantum Mechanics', 'Thermodynamics', 'Robotics'],
                                languages: ['English', 'Chinese'],
                                achievements: ['PhD MIT', 'Published Author', 'Award Winner'],
                                reviewsList: [
                                  {'name': 'Student A', 'comment': 'Amazing tutor!', 'rating': '5'},
                                  {'name': 'Student B', 'comment': 'Very knowledgeable.', 'rating': '5'},
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      FeaturedTutorCard(
                        name: 'Sarah Williams',
                        specialty: 'Mathematics Expert',
                        badge: 'Top Seller',
                        badgeType: 'Top Seller',
                        rating: 4.9,
                        reviews: 156,
                        students: '320+',
                        price: '35',
                        onBook: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingPage(
                                tutorName: 'Sarah Williams',
                                subject: 'Mathematics Expert',
                                price: 35.0,
                              ),
                            ),
                          );
                        },
                        onProfile: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TutorProfilePage(
                                name: 'Sarah Williams',
                                title: 'Mathematics Expert',
                                subject: 'Mathematics',
                                rating: 4.9,
                                reviews: 156,
                                price: 35.0,
                                about: 'Top seller in Mathematics tutoring.',
                                specialties: ['Algebra', 'Calculus', 'Statistics'],
                                languages: ['English'],
                                achievements: ['Top Seller', 'Math Olympiad Winner'],
                                reviewsList: [
                                  {'name': 'Student C', 'comment': 'Helped me ace my exams!', 'rating': '5'},
                                  {'name': 'Student D', 'comment': 'Very patient and clear.', 'rating': '4'},
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      FeaturedTutorCard(
                        name: 'Prof. Lisa Anderson',
                        specialty: 'Chemistry Specialist',
                        badge: 'Verified',
                        badgeType: 'Verified',
                        rating: 4.8,
                        reviews: 234,
                        students: '450+',
                        price: '40',
                        onBook: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingPage(
                                tutorName: 'Prof. Lisa Anderson',
                                subject: 'Chemistry Specialist',
                                price: 40.0,
                              ),
                            ),
                          );
                        },
                        onProfile: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TutorProfilePage(
                                name: 'Prof. Lisa Anderson',
                                title: 'Chemistry Specialist',
                                subject: 'Chemistry',
                                rating: 4.8,
                                reviews: 234,
                                price: 40.0,
                                about: 'Verified Chemistry Specialist with years of experience.',
                                specialties: ['Organic Chemistry', 'Inorganic Chemistry', 'Lab Techniques'],
                                languages: ['English'],
                                achievements: ['Verified', 'Researcher', 'Award Winner'],
                                reviewsList: [
                                  {'name': 'Student E', 'comment': 'Very helpful and knowledgeable.', 'rating': '5'},
                                  {'name': 'Student F', 'comment': 'Explains concepts clearly.', 'rating': '4'},
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
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

class FeaturedTutorCard extends StatefulWidget {
  final String name;
  final String specialty;
  final String badge;
  final String badgeType;
  final double rating;
  final int reviews;
  final String students;
  final String price;
  final VoidCallback onBook;
  final VoidCallback onProfile;

  const FeaturedTutorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.badge,
    required this.badgeType,
    required this.rating,
    required this.reviews,
    required this.students,
    required this.price,
    required this.onBook,
    required this.onProfile,
  });

  @override
  State<FeaturedTutorCard> createState() => _FeaturedTutorCardState();
}

class _FeaturedTutorCardState extends State<FeaturedTutorCard> {

  @override
  Widget build(BuildContext context) {
    const vibrantPurple = Color(0xFFB16CEA);
    const lightPurple = Color(0xFFD1B3FF);
    const gradientStart = Color(0xFFB16CEA);
    const gradientEnd = Color(0xFFFF5E69);
    
    final tutor = {
      'name': widget.name,
      'subject': widget.specialty,
      'rating': widget.rating,
      'price': double.tryParse(widget.price) ?? 0.0,
      'topics': [widget.specialty],
    };
    final isWishlisted = WishlistManager().wishlistTutors.any((t) => t['name'] == widget.name && t['subject'] == widget.specialty);
    
    void toggleWishlist() {
      setState(() {
        if (isWishlisted) {
          WishlistManager().removeTutor(tutor);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Removed from wishlist'), duration: Duration(seconds: 1)),
          );
        } else {
          WishlistManager().addTutor(tutor);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Added to wishlist'), duration: Duration(seconds: 1)),
          );
        }
      });
    }
    
    return Container(
      width: 320,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Stack(
        clipBehavior: Clip.none,
                          children: [
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [gradientStart, gradientEnd],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
                              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 29,
                          backgroundColor: lightPurple.withOpacity(0.7),
                          child: const Icon(Icons.person, size: 32, color: vibrantPurple),
                        ),
                      ),
                    ),
                  ),
                                  Text(
                    widget.name,
                                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Colors.black,
                                    ),
                                  ),
                  const SizedBox(height: 2),
                                  Text(
                    widget.specialty,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                      ...List.generate(5, (i) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: Icon(
                          i < widget.rating.round()
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 18,
                        ),
                      )),
                                      const SizedBox(width: 4),
                      Text(
                        widget.rating.toStringAsFixed(1),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                                  ),
                      const SizedBox(width: 2),
                      Text('(${widget.reviews} reviews)', style: const TextStyle(color: Colors.black87, fontSize: 12)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                      Container(
                        width: 95,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.92),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: vibrantPurple.withOpacity(0.18), width: 1),
                        ),
                        child: Column(
                          children: [
                                Text(
                              widget.students,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: vibrantPurple,
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text('Students', style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Container(
                        width: 95,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.92),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: vibrantPurple.withOpacity(0.18), width: 1),
                        ),
                        child: Column(
                          children: [
                                Text(
                              '\$${widget.price}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: vibrantPurple,
                                  ),
                                ),
                            const SizedBox(height: 2),
                            const Text('Per Hour', style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600)),
                              ],
                        ),
                            ),
                          ],
                        ),
                  const SizedBox(height: 18),
                  Column(
                          children: [
                      OutlinedButton(
                        onPressed: widget.onBook,
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: vibrantPurple, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          elevation: 0,
                          minimumSize: const Size.fromHeight(0),
                        ),
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              colors: [gradientStart, gradientEnd],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(bounds);
                          },
                          child: const Text(
                            'Book Session',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // will be replaced by gradient
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [gradientStart, gradientEnd],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.13),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: widget.onProfile,
                                style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            minimumSize: const Size.fromHeight(0),
                                ),
                                child: const Text(
                                  'View Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 0.2,
                            ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
          // Badge
          Positioned(
            top: 10,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              decoration: BoxDecoration(
                color: widget.badgeType == 'PhD MIT'
                    ? vibrantPurple.withOpacity(0.92)
                    : widget.badgeType == 'Top Seller'
                        ? gradientEnd.withOpacity(0.92)
                        : const Color(0xFF6DD5FA),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
            ),
          ],
        ),
              child: Text(
                widget.badge,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0.2),
              ),
            ),
          ),
          // Wishlist icon
          Positioned(
            top: 10,
            left: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  isWishlisted ? Icons.favorite : Icons.favorite_border,
                  color: isWishlisted ? Colors.red : Colors.grey,
                  size: 20,
                ),
                onPressed: toggleWishlist,
                iconSize: 20,
                padding: const EdgeInsets.all(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension on String {
  toStringAsFixed(int i) {}
}
