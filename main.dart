import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget Example'),
      ),
      body: const Center(
        child: Text('This is a stateless widget'),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: MyStatelessWidget()));
