import 'package:flutter/material.dart';

class SliverPaddingWidget extends StatelessWidget {
  const SliverPaddingWidget({super.key});

//A sliver that applies padding on each side of another sliver.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Padding Example'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Adjust the value as needed
            child: Container(
              color: Colors.blue,
              height: 100,
              width: 100,
              child: const Text('Hello!!!!!!'),
            ),
          ),
        ),
      ),
    );
  }
}
