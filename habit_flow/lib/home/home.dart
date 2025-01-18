import 'package:flutter/material.dart';
import 'package:habit_flow/sidebar/sidebar.dart'; // Import Sidebar

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home - HabitFlow")),
      drawer: Sidebar(), // Call the Sidebar here
      body: Center(child: Text("Welcome to HabitFlow!")),
    );
  }
}
