import 'package:flutter/material.dart';
import 'tutor_profile.dart';
import 'booking_page.dart';
import 'wishlist_manager.dart';

class FindTutorsPage extends StatefulWidget {
  final String? categoryFilter;

  const FindTutorsPage({super.key, this.categoryFilter});

  @override
  State<FindTutorsPage> createState() => _FindTutorsPageState();
}

class _FindTutorsPageState extends State<FindTutorsPage> {
  final List<Map<String, dynamic>> allTutors = const [
    {
      'name': 'John Doe',
      'subject': 'Mathematics',
      'rating': 4.8,
      'price': 35.0,
      'topics': ['Algebra', 'Geometry', 'Calculus'],
    },
    {
      'name': 'Priya Sharma',
      'subject': 'Mathematics',
      'rating': 4.7,
      'price': 30.0,
      'topics': ['Trigonometry', 'Statistics', 'Probability'],
    },
    {
      'name': 'Emily Smith',
      'subject': 'Science',
      'rating': 4.6,
      'price': 40.0,
      'topics': ['Physics', 'Chemistry', 'Biology'],
    },
    {
      'name': 'David Johnson',
      'subject': 'Science',
      'rating': 4.7,
      'price': 38.0,
      'topics': ['Earth Science', 'Physics', 'Chemistry'],
    },
    {
      'name': 'Sarah Lee',
      'subject': 'Languages',
      'rating': 4.9,
      'price': 30.0,
      'topics': ['English', 'French', 'Spanish'],
    },
    {
      'name': 'Carlos Rivera',
      'subject': 'Languages',
      'rating': 4.5,
      'price': 28.0,
      'topics': ['Spanish', 'Portuguese', 'English'],
    },
    {
      'name': 'Michael Brown',
      'subject': 'Programming',
      'rating': 4.5,
      'price': 45.0,
      'topics': ['Python', 'Data Structures', 'Algorithms'],
    },
    {
      'name': 'Ananya Gupta',
      'subject': 'Programming',
      'rating': 4.8,
      'price': 50.0,
      'topics': ['Flutter', 'Web Development', 'C++'],
    },
    {
      'name': 'Liam Turner',
      'subject': 'Music',
      'rating': 4.7,
      'price': 35.0,
      'topics': ['Guitar', 'Piano', 'Vocals'],
    },
    {
      'name': 'Aarav Mehta',
      'subject': 'Music',
      'rating': 4.6,
      'price': 32.0,
      'topics': ['Tabla', 'Harmonium', 'Classical Singing'],
    },
    {
      'name': 'Olivia Wilson',
      'subject': 'Art & Design',
      'rating': 4.8,
      'price': 40.0,
      'topics': ['Drawing', 'Graphic Design', 'Painting'],
    },
    {
      'name': 'Riya Kapoor',
      'subject': 'Art & Design',
      'rating': 4.9,
      'price': 42.0,
      'topics': ['Sketching', 'Digital Illustration', '3D Art'],
    },
    {
      'name': 'James Carter',
      'subject': 'Business',
      'rating': 4.7,
      'price': 50.0,
      'topics': ['Entrepreneurship', 'Marketing', 'Finance'],
    },
    {
      'name': 'Sneha Nair',
      'subject': 'Business',
      'rating': 4.6,
      'price': 48.0,
      'topics': ['Business Strategy', 'Leadership', 'Economics'],
    },
    {
      'name': 'William Smith',
      'subject': 'Test Prep',
      'rating': 4.9,
      'price': 55.0,
      'topics': ['SAT', 'GRE', 'TOEFL'],
    },
    {
      'name': 'Pooja Desai',
      'subject': 'Test Prep',
      'rating': 4.8,
      'price': 52.0,
      'topics': ['IELTS', 'GMAT', 'CAT'],
    },
  ];

  String searchQuery = '';
  bool showFilters = false;

  // Filter state
  String selectedSubject = 'All Subjects';
  double minPrice = 0;
  double maxPrice = 100;
  double minRating = 0;
  bool onlineSessions = false;
  bool inPersonSessions = false;
  bool verifiedTutors = false;

  List<String> get allSubjects => [
    'All Subjects',
    ...{
      ...allTutors.map((t) => t['subject'] as String),
    }
  ];

  void openFilterPanel() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final width = MediaQuery.of(context).size.width;
        final isWide = width > 600;
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: isWide ? 350 : width,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: SafeArea(
              child: FilterPanel(
                allSubjects: allSubjects,
                selectedSubject: selectedSubject,
                minPrice: minPrice,
                maxPrice: maxPrice,
                minRating: minRating,
                onlineSessions: onlineSessions,
                inPersonSessions: inPersonSessions,
                verifiedTutors: verifiedTutors,
                onApply: (subject, minP, maxP, minR, online, inPerson, verified) {
                  setState(() {
                    selectedSubject = subject;
                    minPrice = minP;
                    maxPrice = maxP;
                    minRating = minR;
                    onlineSessions = online;
                    inPersonSessions = inPerson;
                    verifiedTutors = verified;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredTutors = allTutors.where((tutor) {
      final matchesCategory =
          (selectedSubject == 'All Subjects' || tutor['subject'] == selectedSubject) &&
          (widget.categoryFilter == null || tutor['subject'].toString().toLowerCase().contains(widget.categoryFilter!.toLowerCase()));
      final matchesSearch =
          tutor['name'].toString().toLowerCase().contains(searchQuery.toLowerCase()) ||
          tutor['subject'].toString().toLowerCase().contains(searchQuery.toLowerCase());
      final matchesPrice = (tutor['price'] as double) >= minPrice && (tutor['price'] as double) <= maxPrice;
      final matchesRating = (tutor['rating'] as double) >= minRating;
      // For demo, ignore online/in-person/verified
      return matchesCategory && matchesSearch && matchesPrice && matchesRating;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF7ED),
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: Text(
                widget.categoryFilter != null
                    ? '${widget.categoryFilter} Tutors'
                    : 'Find Tutors',
                style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.filter_alt_outlined, color: Colors.orange),
              onPressed: openFilterPanel,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by subject or tutor name...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  if (filteredTutors.isEmpty)
                    const Center(
                      child: Text(
                        'No tutors found.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  else
                    ListView.builder(
                      itemCount: filteredTutors.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final tutor = filteredTutors[index];
                        return tutorCard(
                          context: context,
                          name: tutor['name'],
                          subject: tutor['subject'],
                          rating: tutor['rating'],
                          price: tutor['price'],
                          topics: List<String>.from(tutor['topics']),
                        );
                      },
                    ),
                ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget filterRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 18,
            color: Colors.orange,
          ),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget tutorCard({
    required BuildContext context,
    required String name,
    required String subject,
    required double rating,
    required double price,
    required List<String> topics,
  }) {
    final tutor = {
      'name': name,
      'subject': subject,
      'rating': rating,
      'price': price,
      'topics': topics,
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 500;
    return Card(
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
            padding: EdgeInsets.all(isMobile ? 10 : 16),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.person, size: 32, color: Colors.orange),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                                      child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(Icons.verified, color: Colors.blue, size: 13),
                                          SizedBox(width: 2),
                                          Text('Verified', style: TextStyle(color: Colors.blue, fontSize: 10, fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    // Wishlist icon (mobile)
                                    IconButton(
                                      icon: Icon(
                                        isWishlisted ? Icons.favorite : Icons.favorite_border,
                                        color: isWishlisted ? Colors.orange : Colors.grey,
                                        size: 20,
                                      ),
                                      tooltip: isWishlisted ? 'Remove from wishlist' : 'Add to wishlist',
                                      onPressed: toggleWishlist,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Text(subject, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 13)),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber, size: 14),
                                    const SizedBox(width: 2),
                                    Text('$rating', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                    const SizedBox(width: 6),
                                    const Icon(Icons.circle, color: Colors.green, size: 8),
                                    const SizedBox(width: 2),
                                    Text('Online', style: TextStyle(color: Colors.green, fontSize: 10)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: topics.map((topic) {
                          return Chip(
                            label: Text(topic),
                            backgroundColor: Colors.orange[100],
                            labelStyle: const TextStyle(fontSize: 11),
                            visualDensity: VisualDensity.compact,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.work, size: 13, color: Colors.grey),
                          const SizedBox(width: 2),
                          const Text('5 yrs exp', style: TextStyle(fontSize: 10, color: Colors.black54)),
                          const SizedBox(width: 8),
                          const Icon(Icons.language, size: 13, color: Colors.grey),
                          const SizedBox(width: 2),
                          const Text('English', style: TextStyle(fontSize: 10, color: Colors.black54)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            '\$${price.toStringAsFixed(0)}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const Text('/hour', style: TextStyle(fontSize: 11, color: Colors.black54)),
                          const Spacer(),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TutorProfilePage(
                                      name: name,
                                      title: '$subject Expert',
                                      subject: subject,
                                      rating: rating,
                                      reviews: 100,
                                      price: price,
                                      about: 'Passionate about teaching $subject with interactive methods.',
                                      specialties: topics,
                                      languages: ['English'],
                                      achievements: [
                                        'Certified $subject Tutor',
                                        '5+ years of teaching experience',
                                        'Fluent in English',
                                      ],
                                      reviewsList: [
                                        {
                                          'name': 'Student A',
                                          'comment': '$name is an excellent tutor!',
                                          'rating': '5',
                                        },
                                      ],
                                    ),
                      ),
                    );
                  },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.symmetric(vertical: 8),
                              ),
                              child: const Text('View Profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 100,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.orange, width: 1.2),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.symmetric(vertical: 8),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.message, color: Colors.orange, size: 15),
                                  SizedBox(width: 4),
                                  Text('Message', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 13)),
                                ],
                              ),
                            ),
                ),
              ],
            ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile image or placeholder
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.person, size: 38, color: Colors.orange),
                      ),
                      const SizedBox(width: 18),
                      // Main info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
            Row(
              children: [
                                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(Icons.verified, color: Colors.blue, size: 15),
                                      SizedBox(width: 3),
                                      Text('Verified', style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)),
                                    ],
                  ),
                ),
                // Wishlist icon (desktop)
                IconButton(
                  icon: Icon(
                    isWishlisted ? Icons.favorite : Icons.favorite_border,
                    color: isWishlisted ? Colors.red : Colors.grey,
                    size: 22,
                  ),
                  tooltip: isWishlisted ? 'Remove from wishlist' : 'Add to wishlist',
                  onPressed: toggleWishlist,
                ),
              ],
            ),
                            const SizedBox(height: 2),
                            Text(subject, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 16),
                                const SizedBox(width: 3),
                                Text('$rating', style: const TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(width: 8),
                                const Icon(Icons.circle, color: Colors.green, size: 10),
                                const SizedBox(width: 3),
                                Text('Online', style: TextStyle(color: Colors.green[700], fontSize: 12)),
                              ],
                            ),
                            const SizedBox(height: 6),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: topics.map((topic) {
                return Chip(
                  label: Text(topic),
                  backgroundColor: Colors.orange[100],
                  labelStyle: const TextStyle(fontSize: 12),
                );
              }).toList(),
            ),
                            const SizedBox(height: 8),
            Row(
              children: [
                                const Icon(Icons.work, size: 15, color: Colors.grey),
                                const SizedBox(width: 3),
                                const Text('5 yrs exp', style: TextStyle(fontSize: 12, color: Colors.black54)),
                                const SizedBox(width: 10),
                                const Icon(Icons.language, size: 15, color: Colors.grey),
                                const SizedBox(width: 3),
                                const Text('English', style: TextStyle(fontSize: 12, color: Colors.black54)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Price and actions
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$${price.toStringAsFixed(0)}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const Text('/hour', style: TextStyle(fontSize: 12, color: Colors.black54)),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TutorProfilePage(
                            name: name,
                            title: '$subject Expert',
                            subject: subject,
                            rating: rating,
                            reviews: 100,
                            price: price,
                                      about: 'Passionate about teaching $subject with interactive methods.',
                            specialties: topics,
                            languages: ['English'],
                            achievements: [
                              'Certified $subject Tutor',
                              '5+ years of teaching experience',
                              'Fluent in English',
                            ],
                            reviewsList: [
                              {
                                'name': 'Student A',
                                'comment': '$name is an excellent tutor!',
                                'rating': '5',
                              },
                            ],
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.symmetric(vertical: 10),
                              ),
                              child: const Text('View Profile', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 110,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.orange, width: 1.5),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.symmetric(vertical: 10),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.message, color: Colors.orange, size: 18),
                                  SizedBox(width: 5),
                                  Text('Message', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

// FilterPanel widget
class FilterPanel extends StatefulWidget {
  final List<String> allSubjects;
  final String selectedSubject;
  final double minPrice;
  final double maxPrice;
  final double minRating;
  final bool onlineSessions;
  final bool inPersonSessions;
  final bool verifiedTutors;
  final Function(
    String subject,
    double minPrice,
    double maxPrice,
    double minRating,
    bool online,
    bool inPerson,
    bool verified,
  ) onApply;

  const FilterPanel({
    super.key,
    required this.allSubjects,
    required this.selectedSubject,
    required this.minPrice,
    required this.maxPrice,
    required this.minRating,
    required this.onlineSessions,
    required this.inPersonSessions,
    required this.verifiedTutors,
    required this.onApply,
  });

  @override
  State<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  late String subject;
  late double minPrice;
  late double maxPrice;
  late double minRating;
  late bool onlineSessions;
  late bool inPersonSessions;
  late bool verifiedTutors;

  @override
  void initState() {
    super.initState();
    subject = widget.selectedSubject;
    minPrice = widget.minPrice;
    maxPrice = widget.maxPrice;
    minRating = widget.minRating;
    onlineSessions = widget.onlineSessions;
    inPersonSessions = widget.inPersonSessions;
    verifiedTutors = widget.verifiedTutors;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text('Filters', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 48), // To balance the layout
                  ],
                ),
                const SizedBox(height: 18),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Tutor name or subject',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  ),
                ),
                const SizedBox(height: 18),
                DropdownButtonFormField<String>(
                  value: subject,
                  items: widget.allSubjects.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                  onChanged: (val) => setState(() => subject = val ?? 'All Subjects'),
                  decoration: InputDecoration(
                    labelText: 'Subject',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Min Price',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        ),
                        onChanged: (val) => setState(() => minPrice = double.tryParse(val) ?? 0),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Max Price',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        ),
                        onChanged: (val) => setState(() => maxPrice = double.tryParse(val) ?? 100),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                const Text('Minimum Rating', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 10,
                  runSpacing: 6,
                  children: [
                    for (var r = 5; r >= 2; r--)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: minRating == r.toDouble(),
                            onChanged: (val) => setState(() => minRating = r.toDouble()),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            activeColor: Colors.orange,
                          ),
                          Row(
                            children: List.generate(r, (i) => const Icon(Icons.star, color: Colors.amber, size: 16)),
                          ),
                          const SizedBox(width: 2),
                          const Text('& up', style: TextStyle(fontSize: 13)),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 18),
                const Text('Availability', style: TextStyle(fontWeight: FontWeight.bold)),
                CheckboxListTile(
                  value: onlineSessions,
                  onChanged: (val) => setState(() => onlineSessions = val ?? false),
                  title: const Text('Online Sessions'),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
                CheckboxListTile(
                  value: inPersonSessions,
                  onChanged: (val) => setState(() => inPersonSessions = val ?? false),
                  title: const Text('In-Person Sessions'),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
                CheckboxListTile(
                  value: verifiedTutors,
                  onChanged: (val) => setState(() => verifiedTutors = val ?? false),
                  title: const Text('Verified Tutors'),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onApply(
                        subject,
                        minPrice,
                        maxPrice,
                        minRating,
                        onlineSessions,
                        inPersonSessions,
                        verifiedTutors,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      shadowColor: Colors.orangeAccent,
                    ),
                    child: const Text('Apply Filters', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
