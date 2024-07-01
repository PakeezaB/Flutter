import 'package:flutter/material.dart';

class OverFlowBoxWidget extends StatelessWidget {
  const OverFlowBoxWidget({super.key});

//A widget that imposes different constraints on its child than it gets from its parent, possibly allowing the child to overflow the parent.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Cover Me'),
        // This parent container has fixed width and
        // height of 100 pixels.
        Container(
          width: 100,
          height: 100,
          color: Theme.of(context).colorScheme.secondaryContainer,
          // This OverflowBox imposes its own constraints of maxWidth
          // and maxHeight of 200 pixels on its child which allows the
          // child to overflow the parent container.
          child: const OverflowBox(
            maxWidth: 200,
            maxHeight: 200,
            // Without the OverflowBox, the child widget would be
            // constrained to the size of the parent container
            // and would not overflow the parent container.
            child: FlutterLogo(size: 200),
          ),
        ),
      ],
    ));
  }
}
