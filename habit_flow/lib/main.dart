import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habit_flow/user_authentication/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_flow/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HabitFlow',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Something went wrong!');
          } else if (snapshot.hasData) {
            return Home(); // Show HomeScreen if logged in
          } else {
            return LoginScreen(); // Show LoginScreen if not logged in
          }
        },
      ),
    );
  }
}
