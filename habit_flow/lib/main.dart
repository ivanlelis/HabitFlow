import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:habit_flow/user_authentication/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_flow/home/home.dart';
import 'package:habit_flow/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HabitFlow',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder(
              future: _checkFirstLaunch(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(child: Text('Something went wrong!')),
                  );
                } else {
                  if (snapshot.data == true) {
                    return Onboarding();
                  } else {
                    return AuthWrapper(); // Continue as normal with auth wrapper
                  }
                }
              },
            ),
        '/home': (context) => Home(),
        '/login': (context) => Login(),
      },
    );
  }

  Future<bool> _checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seen = prefs.getBool('seen');
    return seen == null || !seen; // Show onboarding if not seen
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Something went wrong!')),
          );
        } else if (snapshot.hasData) {
          return Home(); // Navigate to HomePage if user is authenticated
        } else {
          return Login(); // Navigate to LoginScreen if user is not authenticated
        }
      },
    );
  }
}
