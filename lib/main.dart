import 'package:flutter/material.dart';
import 'components/BottomBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'farmer test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(95, 95, 136, 190)),
      ),
      
      home: const BottomNavigationBarExample(),
    );
  }
}