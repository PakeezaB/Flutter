import 'package:flutter/material.dart';

import 'sign_up.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Form App',
      initialRoute: '/signup', // Set the initial route to SignUpScreen
      routes: {
        '/signup': (context) =>
            const SignUpScreen(), // Define the signup screen route
      },
    );
  }
}
