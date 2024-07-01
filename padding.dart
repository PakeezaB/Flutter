import 'package:flutter/material.dart';

class paddingExample extends StatelessWidget {
  const paddingExample({super.key});
//A widget that insets its child by the given padding.

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Hello World!'),
          ),
        )
      ]),
    );
  }
}
