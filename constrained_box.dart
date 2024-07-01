import 'package:flutter/material.dart';

class ConsBoxWidget extends StatelessWidget {
  const ConsBoxWidget({super.key});

// widget that imposes additional constraints on its child.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConsBoxWidget'),
      ),
      body: Center(
          child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 100,
          maxHeight: 600,
        ),
        child: ElevatedButton(
          child: const Text('tap me6976987097098908'),
          // ignore: avoid_print
          onPressed: () => print('tap me'),
        ),
      )),
    );
  }
}
