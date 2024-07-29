import 'package:flutter/material.dart';
import 'package:ichi/common/images_strings.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../auth_screens/view/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            titleWidget: Text(
              'ברוך הבא לאיצ\'י', // Welcome to Ichi
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF662D91), // Purple color
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl, // Right-to-left direction
            ),
            bodyWidget: Text(
              'האפליקציה שתגרום לך לעשות דברים טובים כל יום ולהרוויח מטבעות לתרומה', // The app that makes you do good things every day and earn coins for donation
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl, // Right-to-left direction
            ),
            image: Center(
              child: Image.asset(ImageConstants.onBoardingImage1, height: 175.0),
            ),
            decoration: PageDecoration(
              pageColor: Colors.white,
            ),
          ),
          PageViewModel(
            titleWidget: Text(
              'בחר משימה והתחל', // Choose a task and start
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF662D91), // Purple color
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl, // Right-to-left direction
            ),
            bodyWidget: Text(
              'בחר משימות אקראיות כל יום וסמן האם השלמת אותן בסוף היום', // Choose random tasks every day and mark if you completed them at the end of the day
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl, // Right-to-left direction
            ),
            image: Center(
              child: Image.asset(ImageConstants.onBoardingImage2, height: 175.0),
            ),
            decoration: PageDecoration(
              pageColor: Colors.white,
            ),
          ),
          PageViewModel(
            titleWidget: Text(
              'הרוויח מטבעות ותרום', // Earn coins and donate
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF662D91), // Purple color
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl, // Right-to-left direction
            ),
            bodyWidget: Text(
              'השלם משימות כדי להרוויח מטבעות ותרום אותן לארגוני צדקה', // Complete tasks to earn coins and donate them to charities
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl, // Right-to-left direction
            ),
            image: Center(
              child: Image.asset(ImageConstants.onBoardingImage3, height: 175.0),
            ),
            decoration: PageDecoration(
              pageColor: Colors.white,
            ),
          ),
        ],
        onDone: () {
          // When done button is press
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        onSkip: () {
          // You can also override onSkip callback
          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(builder: (context) => LoginScreen()),
          // );
        },
        showSkipButton: true,
        skip: const Text('דלג', style: TextStyle(fontSize: 18.0)), // Skip
        next: const Icon(Icons.arrow_forward),
        done: const Text('התחל', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)), // Done
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(22.0, 10.0),
          activeColor: Color(0xFF662D91), // Purple color
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
