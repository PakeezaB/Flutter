import 'package:flutter/material.dart';

class LimitedBoxWidget extends StatelessWidget {
  const LimitedBoxWidget({super.key});

//A box that limits its size only when it's unconstrained.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        LimitedBox(
          maxHeight: 150,
          child: Container(
            color: Colors.green,
            child: const Text(
              'This box has a max height of 150',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          height: 100,
          color: Colors.blue,
        ),
      ]),
    );
  }
}
