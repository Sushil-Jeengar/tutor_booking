import 'package:flutter/material.dart';
import 'sign_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String selectedRole = 'Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      appBar: AppBar(
        title: const Text(
          'Get Started',
          style: TextStyle(color: Colors.orange),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Join MediaCityTutorBooking',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Create your account and start your journey!',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            textField('Full Name'),
            const SizedBox(height: 15),
            textField('Email'),
            const SizedBox(height: 15),
            textField('Phone Number'),
            const SizedBox(height: 15),
            textField('Password', obscure: true),
            const SizedBox(height: 15),
            textField('Confirm Password', obscure: true),
            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'I want to:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ChoiceChip(
                  label: const Text('Learn'),
                  selected: selectedRole == 'Learn',
                  selectedColor: Colors.orange,
                  onSelected: (selected) {
                    setState(() {
                      selectedRole = 'Learn';
                    });
                  },
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text('Teach'),
                  selected: selectedRole == 'Teach',
                  selectedColor: Colors.orange,
                  onSelected: (selected) {
                    setState(() {
                      selectedRole = 'Teach';
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text('Get Started'),
            ),
            const SizedBox(height: 25),
            const Text('Or sign up with'),
            const SizedBox(height: 15),
            socialButton('Continue with Google', Icons.g_mobiledata),
            const SizedBox(height: 10),
            socialButton('Continue with Facebook', Icons.facebook),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const SignInPage()),
                    );
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(String hint, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }

  Widget socialButton(String text, IconData icon) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        side: const BorderSide(color: Colors.orange),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () {},
      icon: Icon(icon, color: Colors.orange),
      label: Text(text),
    );
  }
}
