import 'package:flutter/material.dart';

class AnimatedPaddingDemo extends StatefulWidget {
  const AnimatedPaddingDemo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedPaddingDemoState createState() => _AnimatedPaddingDemoState();
}

//used to animate changes in the padding of a widget over a given duration
class _AnimatedPaddingDemoState extends State<AnimatedPaddingDemo> {
  double _paddingValue = 20.0;

  void _changePadding() {
    setState(() {
      _paddingValue = _paddingValue == 20.0 ? 50.0 : 20.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Padding Demo'),
      ),
      body: Center(
        child: AnimatedPadding(
          padding: EdgeInsets.all(_paddingValue),
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: Container(
            color: Colors.blue,
            width: 200,
            height: 200,
            child: const Center(
              child: Text(
                'Animated Padding',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changePadding,
        tooltip: 'Change Padding',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
