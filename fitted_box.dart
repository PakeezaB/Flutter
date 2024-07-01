import 'package:flutter/material.dart';

class FittedBoxWidget extends StatelessWidget {
  const FittedBoxWidget({super.key});

//Scales and positions its child within itself according to fit.
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      color: Colors.blue,
      child: const FittedBox(
        fit: BoxFit.fill,
        child: Placeholder(),
      ),
    );
  }
}
