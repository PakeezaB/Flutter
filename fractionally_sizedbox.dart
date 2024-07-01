import 'package:flutter/material.dart';

class FractionallyWidget extends StatelessWidget {
  const FractionallyWidget({super.key});

//A widget that sizes its child to a fraction of the total available space.
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FractionallySizedBox(
        widthFactor: 1.0,
        heightFactor: 0.5,
        alignment: FractionalOffset.center,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 4,
            ),
          ),
        ),
      ),
    );
  }
}
