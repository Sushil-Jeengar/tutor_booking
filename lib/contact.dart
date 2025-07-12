import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  ContactUsPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.menu_book, color: Colors.orange),
            SizedBox(width: 8),
            Text(
              'MediaCityTutorBooking',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.withAlpha(25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Contact Us',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'We\'re Here to Help!',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Have questions? Need support? Reach out to us anytime!',
                    style: TextStyle(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Contact Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            infoRow(
              Icons.location_on,
              'Address',
              '123 Learning Street\nEducation City, EC 12345',
            ),
            const SizedBox(height: 16),
            infoRow(Icons.phone, 'Phone', '+1 (555) 123-4567'),
            const SizedBox(height: 16),
            infoRow(Icons.email, 'Email', 'hello@mediacitytutorbooking.com'),
            const SizedBox(height: 16),
            infoRow(
              Icons.access_time,
              'Business Hours',
              'Monday - Friday: 9:00 AM - 6:00 PM\nSaturday: 10:00 AM - 4:00 PM\nSunday: Closed',
            ),

            const SizedBox(height: 40),

            const Text(
              'Send a Message',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  buildTextField(controller: nameController, hint: 'Name'),
                  const SizedBox(height: 10),
                  buildTextField(controller: emailController, hint: 'Email'),
                  const SizedBox(height: 10),
                  buildTextField(
                    controller: phoneController,
                    hint: 'Phone Number',
                  ),
                  const SizedBox(height: 10),
                  buildTextField(
                    controller: subjectController,
                    hint: 'Subject',
                  ),
                  const SizedBox(height: 10),
                  buildTextField(
                    controller: messageController,
                    hint: 'Description',
                    maxLines: 4,
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // You can handle form submission here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Message Sent! (Dummy Action)'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('Send Message'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget infoRow(IconData icon, String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.orange),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(content, style: const TextStyle(color: Colors.black54)),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter $hint';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
