import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(BiruniMobileProject());
}

class BiruniMobileProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biruni Üniversitesi',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}
