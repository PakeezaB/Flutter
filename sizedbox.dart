import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {
  const SizedBoxWidget({super.key});

//A box with a specified size.

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [
        SizedBox(
          width: 200.0,
          height: 300.0,
          child: Card(child: Text('Hello World!')),
        )
      ]),
    );
  }
}
