import 'package:flutter/material.dart';
import 'package:soft_eng_cmc/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Prelim',
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const MainScreen(),
      },
    );
  }
}
