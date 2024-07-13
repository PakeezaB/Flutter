import 'package:flutter/material.dart';

class SafeAreaScreen extends StatelessWidget {
  const SafeAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SafeArea Example'),
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'SafeArea ensures content is visible',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: null,
                child: Text('Button Inside SafeArea'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
