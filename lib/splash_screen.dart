import 'package:flutter/material.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const BottomNavWrapper()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.menu_book, size: 100, color: Colors.orange),
            SizedBox(height: 20),
            Text(
              'MediaCityTutorBooking',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
