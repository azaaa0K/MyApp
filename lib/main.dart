import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

// ==========================
// 🚀 APP ENTRY POINT
// ==========================
void main() {
  runApp(const MyEmpire());
}

class MyEmpire extends StatelessWidget {
  const MyEmpire({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
