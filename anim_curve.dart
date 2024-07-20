import 'package:flutter/material.dart';

class AnimationCurveHomePage extends StatefulWidget {
  const AnimationCurveHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimationCurveHomePageState createState() => _AnimationCurveHomePageState();
}

//used in design and development for various reasons

class _AnimationCurveHomePageState extends State<AnimationCurveHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void _startAnimation() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Animation Curve Demo'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _startAnimation,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                width: 200.0 + (_animation.value * 100.0),
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(_animation.value * 100.0),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
