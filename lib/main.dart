import 'package:flutter/material.dart';
import 'package:mb_task2/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: 
        ThemeData(brightness: Brightness.dark, primaryColor: Colors.orange),
    );
  }
}