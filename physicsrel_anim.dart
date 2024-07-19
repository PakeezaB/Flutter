import 'package:flutter/material.dart';

class PhysicsAnimationScreen extends StatefulWidget {
  const PhysicsAnimationScreen({super.key});

//motion is modeled to resemble real-world behavior

  @override
  // ignore: library_private_types_in_public_api
  _PhysicsAnimationScreenState createState() => _PhysicsAnimationScreenState();
}

class _PhysicsAnimationScreenState extends State<PhysicsAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);

    _controller.repeat(reverse: true);
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
        title: const Text('Physics Animation Screen'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              margin: EdgeInsets.only(top: _animation.value * 200),
              child: child,
            );
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
