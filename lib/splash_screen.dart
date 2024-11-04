import 'package:apnu_umreth/View/authentigation/login_page.dart';
import 'package:apnu_umreth/components/color.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // Animation controller and animation
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Set duration of animation
    );

    // Create a fade-in animation
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // Start the animation
    _animationController.forward();

    // Timer to navigate to the next page after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage()), // Replace with your next page
      );
    });
  }

  @override
  void dispose() {
    _animationController
        .dispose(); // Dispose the controller to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryColor1,
              AppColors.primaryColor2,
            ],
          ),
        ),
        child: Center(
          child: FadeTransition(
            // Apply fade transition
            opacity: _animation,
            child: Image.asset(
              'assets/images/au.png',
              width: 400, // Set width for the image
              height: 400, // Set height for the image
            ),
          ),
        ),
      ),
    );
  }
}

// Next page example (replace with your actual next page)
