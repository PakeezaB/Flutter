import 'package:flutter/material.dart';

class IntrinsicWidthWidget extends StatelessWidget {
  IntrinsicWidthWidget({super.key});

//A widget that sizes its child to the child's intrinsic width.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IntrinsicWidth Example'),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            children: [
              Container(
                color: Colors.red,
                child: const Text('Short'),
              ),
              Container(
                color: Colors.green,
                child: const Text('A bit longer'),
              ),
              Container(
                color: Colors.blue,
                child: const Text('The longest text in this column'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
