import 'package:flutter/material.dart';
import 'package:ichi/common/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../onboarding_screens/view/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(milliseconds: 3000), () {}); // Wait for 3 seconds
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1), // Purple color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // App Logo
            Image.asset(
              'assets/images/balanceme.png',
              height: 300,
              width: 300,
            ),
            // SizedBox(height: 20),
            // App Name in Hebrew
            // Text(
            //   'איצ\'י',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 40,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(height: 40),
            // Loading Animation Widget
            LoadingAnimationWidget.fourRotatingDots(
              color: AppColors.primaryColor,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
