import 'package:flutter/material.dart';
import 'package:ticketing_app/landing_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticketig App',
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

