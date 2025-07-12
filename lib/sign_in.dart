import 'package:flutter/material.dart';
import 'sign_up.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      appBar: AppBar(
        title: const Text('Sign In', style: TextStyle(color: Colors.orange)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Welcome Back!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sign in to continue your learning journey.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            textField('Email'),
            const SizedBox(height: 15),
            textField('Password', obscure: true),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 25),
            const Text('Or sign in with'),
            const SizedBox(height: 15),
            socialButton('Continue with Google', Icons.g_mobiledata),
            const SizedBox(height: 10),
            socialButton('Continue with Facebook', Icons.facebook),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account? '),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const SignUpPage()),
                    );
                  },
                  child: const Text(
                    'Get Started',
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
