import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:habit_flow/home/home.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to HabitFlow",
          body: "Build habits that fit your life. No pressure, just progress.",
          image: Center(
            child: Image.asset(
              "assets/images/Page_1.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          decoration: PageDecoration(
            pageColor: Colors.white,
            bodyTextStyle: TextStyle(fontSize: 18),
          ),
        ),
        PageViewModel(
          title: "Track your Progress",
          body:
              "Track your habits, see your progress, and celebrate small wins.",
          image: Center(
            child: Image.asset(
              "assets/images/Page_2.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          decoration: PageDecoration(
            pageColor: Colors.white,
            bodyTextStyle: TextStyle(fontSize: 18),
          ),
        ),
        PageViewModel(
          title: "Achieve Your Goals",
          body: "Ready to start your journey? Let’s begin together!",
          image: Center(
            child: Image.asset(
              "assets/images/Page_3.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          decoration: PageDecoration(
            pageColor: Colors.white,
            bodyTextStyle: TextStyle(fontSize: 18),
          ),
        ),
      ],
      onDone: () async {
        // Save that the onboarding has been completed
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('seen', true);
        // Navigate to the home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      },
      showSkipButton: true,
      skip: Text("Skip"),
      next: Icon(Icons.arrow_forward),
      done: Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
