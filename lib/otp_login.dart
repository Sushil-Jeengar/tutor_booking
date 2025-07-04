import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:math';

class OtpLoginScreen extends StatefulWidget {
  const OtpLoginScreen({super.key});

  @override
  State<OtpLoginScreen> createState() => _OtpLoginScreenState();
}

class _OtpLoginScreenState extends State<OtpLoginScreen> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String _generatedOtp = '';
  String _selectedOption = 'Phone'; // Default is Phone

  void _toggleOption() {
    setState(() {
      _selectedOption = _selectedOption == 'Phone' ? 'Email' : 'Phone';
      _inputController.clear();
    });
  }

  void _generateOtp() {
    setState(() {
      _generatedOtp = (1000 + Random().nextInt(9000)).toString();
    });

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
      Navigator.of(context, rootNavigator: true).pop();
    });
  }



  void _verifyOtp() {
    if (_otpController.text == _generatedOtp) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavWrapper()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
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
                Text(
                  _selectedOption == 'Phone' ? 'Phone OTP Login' : 'Email OTP Login',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _inputController,
                  keyboardType: _selectedOption == 'Phone' ? TextInputType.phone : TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      _selectedOption == 'Phone' ? Icons.phone : Icons.email,
                      color: Colors.orange,
                    ),
                    hintText: _selectedOption == 'Phone' ? 'Enter your phone number' : 'Enter your email address',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: _toggleOption,
                      icon: const Icon(Icons.swap_horiz, color: Colors.orange),
                      label: Text(
                        _selectedOption == 'Phone' ? 'Use Email' : 'Use Phone',
                        style: const TextStyle(color: Colors.orange),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),

                ElevatedButton.icon(
                  onPressed: _generateOtp,
                  icon: const Icon(Icons.send),
                  label: Text('Send OTP to $_selectedOption'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
