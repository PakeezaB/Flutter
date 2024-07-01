import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

//widget that combines common painting, positioning, and sizing widgets.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        height: 100,
        width: 200,
        child: const Center(
            child: Text(
          'Hello World',
        )),
      ),
    );
  }
}
