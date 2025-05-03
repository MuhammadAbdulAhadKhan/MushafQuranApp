import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:mushafapp/OptionsScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation setup
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward(); // Start animation

    // Navigate to next screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OptionsScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 77, 107),
              Color(0xff2f80ed),
              Color.fromARGB(255, 57, 94, 123),
            ],
            stops: [0, 0.5, 1],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: FadeScaleTransition(
              animation: _animation,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Image.asset(
                  'assets/AppLogo.png', // Or use .webp for better performance
                  width: 400,
                  height: 400,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
