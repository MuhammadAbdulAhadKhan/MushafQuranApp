import 'package:flutter/material.dart';
import 'package:mushafapp/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appمصحف',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 214, 238, 240),
        ),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
