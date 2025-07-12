import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:math';

class OtpLoginScreen extends StatefulWidget {
  const OtpLoginScreen({super.key});

  @override
  State<OtpLoginScreen> createState() => _OtpLoginScreenState();
}

class _OtpLoginScreenState extends State<OtpLoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String _generatedOtp = '';
  String _selectedOption = 'Phone'; // Track which option was used

  void _onPhoneChanged(String value) {
    if (value.isNotEmpty) {
      setState(() {
        _selectedOption = 'Phone';
        _emailController.clear();
      });
    }
  }

  void _onEmailChanged(String value) {
    if (value.isNotEmpty) {
      setState(() {
        _selectedOption = 'Email';
        _phoneController.clear();
      });
    }
  }

  void _generateOtp(String type) {
    setState(() {
      _generatedOtp = (1000 + Random().nextInt(9000)).toString();
    });

    // Store context before async operation
    final navigatorContext = context;

    showDialog(
      context: context,
      barrierDismissible: false, // Prevent manual dismiss during 2 seconds
      builder: (context) {
        return Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.sms, color: Colors.orange, size: 30),
                    const SizedBox(height: 10),
                    Text(
                      'Your OTP is $_generatedOtp',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(navigatorContext, rootNavigator: true).pop();
    });
  }

  void _verifyOtp() {
    final currentContext = context;
    if (_otpController.text == _generatedOtp) {
      Navigator.pushReplacement(
        currentContext,
        MaterialPageRoute(builder: (context) => const BottomNavWrapper()),
      );
    } else {
      ScaffoldMessenger.of(currentContext).showSnackBar(
        const SnackBar(content: Text('Incorrect OTP, please try again')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('OTP Login', style: TextStyle(color: Colors.orange)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_outline, size: 100, color: Colors.orange),
                const SizedBox(height: 20),
                const Text(
                  'OTP Login',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 30),
                
                // Phone Number Field
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  onChanged: _onPhoneChanged,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone, color: Colors.orange),
                    hintText: 'Enter your phone number',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                
                const SizedBox(height: 15),
                
                // OR Separator
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 15),
                
                // Email Field
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: _onEmailChanged,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email, color: Colors.orange),
                    hintText: 'Enter your email address',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                
                // Send OTP Button
                ElevatedButton.icon(
                  onPressed: (_phoneController.text.isNotEmpty || _emailController.text.isNotEmpty)
                      ? () => _generateOtp(_selectedOption)
                      : null,
                  icon: const Icon(Icons.send),
                  label: Text('Send OTP to $_selectedOption'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.orange),
                    hintText: 'Enter OTP',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: _verifyOtp,
                  icon: const Icon(Icons.login),
                  label: const Text('Verify & Login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
