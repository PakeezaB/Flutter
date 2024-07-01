import 'package:flutter/material.dart';

class AspectRatiowidget extends StatelessWidget {
  const AspectRatiowidget({super.key});

//widget that attempts to size the child to a specific aspect ratio.
//useful when we have to display images,videos or other content in a certain proportion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aspect Ratio'),
      ),
      body: Container(
        color: Colors.amberAccent,
        alignment: Alignment.bottomRight,
        width: double.infinity,
        height: 120,
        child: AspectRatio(
          aspectRatio: 0.5,
          child: Container(
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
    );
  }
}
