import 'package:chess_app/screens/landing.dart';
import 'package:chess_app/services/playerState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<PlayerState>(
    child: const MyApp(),
    create: (_) => PlayerState(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Chess App',
        home: Scaffold(
          body: LandingScreen(),
        ));
  }
}
