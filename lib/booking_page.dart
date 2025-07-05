import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  final String tutorName;
  final String subject;
  final double price;

  const BookingPage({
    super.key,
    required this.tutorName,
    required this.subject,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Booking', style: TextStyle(color: Colors.orange)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Tutor Info
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.person, color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tutorName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(subject, style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 4),
                        const Row(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.orange),
                            SizedBox(width: 4),
                            Text('4.9 (127 reviews)'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Session Type
            const Text('Choose Session Type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.orange.withOpacity(0.05),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        const Icon(Icons.video_call, color: Colors.orange, size: 30),
                        const SizedBox(height: 8),
                        const Text('Online Session', style: TextStyle(fontWeight: FontWeight.bold)),
                        const Text('Recommended', style: TextStyle(color: Colors.blue, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        const Icon(Icons.location_on, color: Colors.green, size: 30),
                        const SizedBox(height: 8),
                        const Text('In-Person Session', style: TextStyle(fontWeight: FontWeight.bold)),
                        const Text('Available in your area', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Date & Time Selection
            const Text('Select Date & Time', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            dateTimeRow('Today', ['2:00 PM', '4:00 PM', '6:00 PM']),
            dateTimeRow('Tomorrow', ['10:00 AM', '2:00 PM', '5:00 PM']),
            dateTimeRow('Friday', ['9:00 AM', '1:00 PM', '3:00 PM', '7:00 PM']),
            dateTimeRow('Saturday', ['11:00 AM', '2:00 PM', '4:00 PM']),

            const SizedBox(height: 20),

            /// Session Details
            const Text('Session Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Describe what you\'d like to focus on in this session...',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Your Level',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              items: const [
                DropdownMenuItem(value: 'Beginner', child: Text('Beginner')),
                DropdownMenuItem(value: 'Intermediate', child: Text('Intermediate')),
                DropdownMenuItem(value: 'Advanced', child: Text('Advanced')),
              ],
              onChanged: (value) {},
            ),

            const SizedBox(height: 20),

            /// Your Information
            const Text('Your Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            /// Payment Summary
            summaryCard(),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Booking logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Booking Completed!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Complete Booking'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Date Time Row Helper
  Widget dateTimeRow(String day, List<String> times) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            children: times.map((time) {
              return OutlinedButton(
                onPressed: () {},
                child: Text(time),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  /// Booking Summary Card
  Widget summaryCard() {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Booking Summary', style: TextStyle(fontWeight: FontWeight.bold)),
            const Divider(),
            const Text('Selected Session', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Date: Dec 26, 2024'),
            const Text('Time: 2:00 PM - 3:00 PM'),
            const Text('Duration: 60 minutes'),
            const Text('Type: Online Session'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Session Fee:'),
                Text('\$${price.toStringAsFixed(2)}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Platform Fee:'),
                Text('\$2.50'),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('\$${(price + 2.5).toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            const Text('Payment Method', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.credit_card, color: Colors.orange),
              label: const Text('Credit/Debit Card'),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('✔ Secure Booking'),
                  Text('✔ SSL encrypted payment'),
                  Text('✔ Money-back guarantee'),
                  Text('✔ 24/7 support available'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
