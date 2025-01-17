import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habit_flow/user_authentication/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_flow/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('Firebase Initialized');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HabitFlow',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthWrapper(), // Use a wrapper for user authentication check
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Stream to monitor the user's authentication status
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
                child: CircularProgressIndicator()), // Splash loading indicator
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Something went wrong!')),
          );
        } else if (snapshot.hasData) {
          return Home(); // Navigate to HomePage if user is authenticated
        } else {
          return LoginScreen(); // Navigate to LoginScreen if user is not authenticated
        }
      },
    );
  }
}
