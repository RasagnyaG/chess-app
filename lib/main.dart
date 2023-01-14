import 'package:chess_app/screens/landing.dart';
import 'package:chess_app/screens/players.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chess App',
        home: Scaffold(
          body: LandingScreen(),
        ));
  }
}
