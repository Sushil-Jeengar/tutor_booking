import 'package:flutter/material.dart';
import 'booking_page.dart';

class TutorProfilePage extends StatelessWidget {
  final String name;
  final String title;
  final String subject;
  final double rating;
  final int reviews;
  final double price;
  final String about;
  final List<String> specialties;
  final List<String> languages;
  final List<String> achievements;
  final List<Map<String, String>> reviewsList;

  const TutorProfilePage({
    super.key,
    required this.name,
    required this.title,
    required this.subject,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.about,
    required this.specialties,
    required this.languages,
    required this.achievements,
    required this.reviewsList,
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;
    final isMobile = MediaQuery.of(context).size.width < 500;
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Tutor Profile',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Column(
                  children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFB347), Color(0xFFFF9900)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 20, vertical: isMobile ? 16 : 24),
                    child: isMobile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 32,
                                    backgroundColor: Colors.white,
                                    child: const Icon(Icons.person, size: 32, color: Colors.orange),
                                  ),
                                  const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                            fontSize: 18,
                              fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Wrap(
                                          spacing: 6,
                                          runSpacing: 2,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                              decoration: BoxDecoration(
                                                color: Colors.blue[50],
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: const [
                                                  Icon(Icons.verified, color: Colors.blue, size: 13),
                                                  SizedBox(width: 2),
                                                  Text('Verified', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 11)),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                              decoration: BoxDecoration(
                                                color: Color(0xFF22C55E).withOpacity(0.15),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: const [
                                                  Icon(Icons.circle, color: Color(0xFF22C55E), size: 10),
                                                  SizedBox(width: 2),
                                                  Text('Online', style: TextStyle(color: Color(0xFF22C55E), fontWeight: FontWeight.bold, fontSize: 11)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                          Text(
                            title,
                                style: const TextStyle(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                subject,
                                style: const TextStyle(fontSize: 12, color: Colors.black54),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    '\$${price.toStringAsFixed(0)}',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                                  ),
                                  const Text('/hour', style: TextStyle(fontSize: 12, color: Colors.black54)),
                                  const SizedBox(width: 10),
                                  Expanded(
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
                                        backgroundColor: Colors.orange,
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      ),
                                      child: const Text('Book Session', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: const Icon(Icons.person, size: 40, color: Colors.orange),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            name,
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: Colors.blue[50],
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: const [
                                              Icon(Icons.verified, color: Colors.blue, size: 16),
                                              SizedBox(width: 3),
                                              Text('Verified', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 13)),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF22C55E).withOpacity(0.15),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: const [
                                              Icon(Icons.circle, color: Color(0xFF22C55E), size: 12),
                                              SizedBox(width: 3),
                                              Text('Online', style: TextStyle(color: Color(0xFF22C55E), fontWeight: FontWeight.bold, fontSize: 13)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      title,
                                      style: const TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      subject,
                                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              if (isWide) ...[
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${price.toStringAsFixed(0)}',
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black),
                                    ),
                                    const Text('/hour', style: TextStyle(fontSize: 13, color: Colors.black54)),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: 150,
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
                                          backgroundColor: Colors.orange,
                                          padding: const EdgeInsets.symmetric(vertical: 14),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        ),
                                        child: const Text('Book Session', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 20, vertical: isMobile ? 8 : 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isMobile
                            ? Wrap(
                                spacing: 10,
                                runSpacing: 6,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.star, color: Colors.amber, size: 16),
                                      const SizedBox(width: 2),
                                      Text('$rating', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                      Text(' ($reviews reviews)', style: const TextStyle(color: Colors.black54, fontSize: 12)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(Icons.location_on, color: Colors.orange, size: 14),
                                      SizedBox(width: 2),
                                      Text('0.5 mi', style: TextStyle(fontSize: 11, color: Colors.black87)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(Icons.timer, color: Colors.orange, size: 14),
                                      SizedBox(width: 2),
                                      Text('Responds in < 1 hour', style: TextStyle(fontSize: 11, color: Colors.black87)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(Icons.work, color: Colors.orange, size: 14),
                                      SizedBox(width: 2),
                                      Text('8 years experience', style: TextStyle(fontSize: 11, color: Colors.black87)),
                                    ],
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 18),
                                  const SizedBox(width: 4),
                                  Text('$rating', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  Text(' ($reviews reviews)', style: const TextStyle(color: Colors.black54, fontSize: 14)),
                                  const SizedBox(width: 16),
                                  const Icon(Icons.location_on, color: Colors.orange, size: 16),
                                  const SizedBox(width: 2),
                                  const Text('0.5 mi', style: TextStyle(fontSize: 13, color: Colors.black87)),
                                  const SizedBox(width: 16),
                                  const Icon(Icons.timer, color: Colors.orange, size: 16),
                                  const SizedBox(width: 2),
                                  const Text('Responds in < 1 hour', style: TextStyle(fontSize: 13, color: Colors.black87)),
                                  const SizedBox(width: 16),
                                  const Icon(Icons.work, color: Colors.orange, size: 16),
                                  const SizedBox(width: 2),
                                  const Text('8 years experience', style: TextStyle(fontSize: 13, color: Colors.black87)),
                                ],
                    ),
                  ],
                ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // About Me
            const Text(
              'About Me',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(about, style: const TextStyle(fontSize: 15, color: Colors.black87)),
              ),
            ),
            const SizedBox(height: 24),

            // Specialties & Languages
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.orange, size: 18),
                          SizedBox(width: 6),
                          Text('Specialties', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
            ),
            const SizedBox(height: 8),
            Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ...specialties.map((s) => Chip(
                                label: Text(s, style: const TextStyle(color: Color(0xFF8A5C00), fontWeight: FontWeight.bold)),
                                backgroundColor: const Color(0xFFFFF3CD),
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.language, color: Colors.orange, size: 18),
                          SizedBox(width: 6),
                          Text('Languages', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
            ),
            const SizedBox(height: 8),
            Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ...languages.map((l) => Chip(
                                label: Text(l, style: const TextStyle(color: Color(0xFF1565C0), fontWeight: FontWeight.bold)),
                                backgroundColor: const Color(0xFFE3F0FF),
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Achievements & Qualifications
            const Text(
              'Achievements & Qualifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...achievements.map((achieve) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle, color: Colors.green, size: 18),
                              const SizedBox(width: 8),
                              Expanded(child: Text(achieve, style: const TextStyle(fontSize: 15))),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Student Reviews
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isMobile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Student Reviews', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 16),
                                  const SizedBox(width: 3),
                                  Text('$rating', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  Flexible(
                                    child: Text(' ($reviews reviews)', style: const TextStyle(color: Colors.black54, fontSize: 13), overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Student Reviews', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 20),
                                  const SizedBox(width: 4),
                                  Text('$rating', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                  Text(' ($reviews reviews)', style: const TextStyle(color: Colors.black54, fontSize: 15)),
                                ],
                              ),
                            ],
                          ),
                    const SizedBox(height: 10),
                    ...reviewsList.take(3).map((review) => Column(
                          children: [
                            isMobile
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Text(review['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), overflow: TextOverflow.ellipsis),
                                                ),
                                                const SizedBox(width: 6),
                                                if (review['subject'] != null)
                                                  Chip(
                                                    label: Text(review['subject']!, style: const TextStyle(fontSize: 10, color: Color(0xFF8A5C00))),
                                                    backgroundColor: const Color(0xFFFFF3CD),
                                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                                                    visualDensity: VisualDensity.compact,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      Row(
                                        children: List.generate(
                                          5,
                                          (index) => Icon(
                                            index < int.parse(review['rating']!)
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: Colors.orange,
                                            size: 13,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(review['timeAgo'] ?? '', style: const TextStyle(color: Colors.black54, fontSize: 10)),
                                      ),
                                    ],
                                  )
                                : Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(review['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                                                const SizedBox(width: 8),
                                                if (review['subject'] != null)
                                                  Chip(
                                                    label: Text(review['subject']!, style: const TextStyle(fontSize: 12, color: Color(0xFF8A5C00))),
                                                    backgroundColor: const Color(0xFFFFF3CD),
                                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                    visualDensity: VisualDensity.compact,
                                                  ),
                                              ],
                                            ),
                                            const SizedBox(height: 2),
                                            Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < int.parse(review['rating']!)
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.orange,
                          size: 16,
                        ),
                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(review['timeAgo'] ?? '', style: const TextStyle(color: Colors.black54, fontSize: 13)),
                                    ],
                                  ),
                            const SizedBox(height: 4),
                            Text(review['comment']!, style: const TextStyle(fontSize: 15)),
                            const Divider(height: 22),
                          ],
                        )),
                    const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.orange, width: 1.2),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text('View All Reviews', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
