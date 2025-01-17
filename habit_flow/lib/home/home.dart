import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home - HabitFlow")),
      body: Center(child: Text("Welcome to HabitFlow!")),
    );
  }
}
