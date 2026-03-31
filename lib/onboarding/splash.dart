import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practisecorner/onboarding/loginwithnumber.dart';
import 'package:practisecorner/screens/bottombar/bottom_bar.dart';
import 'package:practisecorner/utills/custom_colors.dart';

class Splash extends StatefulWidget {
  Splash({
    super.key,
  });

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int dotCount = 0;
  late double h, w;

  @override
  void initState() {
    super.initState();
    // Delay before navigating to the next screen after the animation and hold
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Loginwithnumber()));
    });

    // Create a timer to animate the dots in the loading bar
    Timer.periodic(const Duration(milliseconds: 800), (timer) {
      setState(() {
        dotCount = (dotCount + 1) % 4; // Cycle through 3 dots
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white, // Light background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated logo with scale effect
            TweenAnimationBuilder<double>(
              tween:
                  Tween<double>(begin: 0.3, end: 1.0), // Scale from 0.3 to 1.0
              duration: const Duration(seconds: 2), // Animation duration
              curve: Curves.easeInOut, // Smooth transition
              builder: (context, scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: Center(
                    child: Image.asset(
                      'assets/icons/newlogo.png',
                      height: h * 0.6,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            // Custom loading bar with animated dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Text(
                  '. ' * ((index < dotCount) ? 1 : 0), // Animate the dots
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.primary,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
