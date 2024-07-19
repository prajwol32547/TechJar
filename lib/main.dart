import 'package:flutter/material.dart';
import 'package:tecapp/Presentation/HomeScreen/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Jar',
      theme: ThemeData(
        textTheme: TextTheme(
            labelLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            labelSmall:
                TextStyle(fontSize: 14, color: Colors.black.withOpacity(.8))),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 19, 18, 18)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
