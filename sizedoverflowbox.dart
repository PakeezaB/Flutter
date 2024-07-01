import 'package:flutter/material.dart';

class OverflowSizedBox extends StatelessWidget {
  const OverflowSizedBox({super.key});

//A widget that is a specific size but passes its original constraints through to its child, which will probably overflow.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [
        OverflowBox(
          minWidth: 200.0,
          maxHeight: 300.0,
          child: Card(child: Text('Hello World!')),
        )
      ]),
    );
  }
}
