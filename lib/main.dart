import 'package:flutter/material.dart';
import 'package:meditation_app/screens/meditation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MeditationScreen(),
    );
  }
}
