import 'package:flutter/material.dart';

//to control the proportional relationship between
//the width and height of an element or a widget
class AspectRatioScreen extends StatelessWidget {
  const AspectRatioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AspectRatio Example'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                '16:9 Aspect Ratio',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
