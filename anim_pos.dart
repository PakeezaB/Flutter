import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

//used to animate the position of a child widget within a container
//based on(top,left,right, bottom) properties
  @override
  // ignore: library_private_types_in_public_api
  _AnimatedPositionedExampleState createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool _isMoved = false;

  void _moveBox() {
    setState(() {
      _isMoved = !_isMoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Positioned Example'),
      ),
      body: Center(
        child: Stack(
          children: [
            AnimatedPositioned(
              width: 100.0,
              height: 100.0,
              top: _isMoved ? 200.0 : 50.0,
              left: _isMoved ? 200.0 : 50.0,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _moveBox,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
