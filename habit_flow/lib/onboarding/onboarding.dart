import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:habit_flow/home/home.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          titleWidget: SizedBox.shrink(), // Remove the title from the top
          bodyWidget: Column(
            children: [
              Image.asset(
                "assets/images/1.png",
                fit: BoxFit.contain,
                width: 700,
                height: 700,
              ),
              Transform.translate(
                offset: Offset(0, -150), // Moves the text 20 pixels upward
                child: Column(
                  children: [
                    Text(
                      "Welcome to HabitFlow",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Build habits that fit your life. No pressure, just progress.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          decoration: PageDecoration(
            pageColor: Colors.white,
          ),
        ),
        PageViewModel(
          titleWidget: SizedBox.shrink(),
          bodyWidget: Column(
            children: [
              Image.asset(
                "assets/images/2.png",
                fit: BoxFit.contain,
                width: 700,
                height: 700,
              ),
              Transform.translate(
                offset: Offset(0, -150), // Moves the text 20 pixels upward
                child: Column(
                  children: [
                    Text(
                      "Track your Progress",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Track your habits, see your progress, and celebrate small wins.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          decoration: PageDecoration(
            pageColor: Colors.white,
          ),
        ),
        PageViewModel(
          titleWidget: SizedBox.shrink(),
          bodyWidget: Column(
            children: [
              Image.asset(
                "assets/images/3.png",
                fit: BoxFit.contain,
                width: 700,
                height: 700,
              ),
              Transform.translate(
                offset: Offset(0, -150), // Moves the text 20 pixels upward
                child: Column(
                  children: [
                    Text(
                      "Achieve Your Goals",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Ready to start your journey? Let’s begin together!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          decoration: PageDecoration(
            pageColor: Colors.white,
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
      next: Text("Next", style: TextStyle(color: Colors.blue)),
      done: Text("Done", style: TextStyle(fontWeight: FontWeight.bold)),
      dotsDecorator: DotsDecorator(
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        activeColor: Colors.blue,
      ),
    );
  }
}
