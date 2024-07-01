import 'package:flutter/material.dart';

class IntrinsicheightWidget extends StatelessWidget {
  const IntrinsicheightWidget({super.key});

//A widget that sizes its child to the child's intrinsic height.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.red,
                width: 100,
                height: 50,
                child: const Center(child: Text('Short')),
              ),
              Container(
                color: Colors.green,
                width: 100,
                height: 100,
                child: const Center(child: Text('Tall')),
              ),
              Container(
                color: Colors.blue,
                width: 100,
                height: 75,
                child: const Center(child: Text('Medium')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
