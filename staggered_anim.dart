import 'package:flutter/material.dart';

class StaggeredAnimationScreen extends StatefulWidget {
  const StaggeredAnimationScreen({super.key});

//Animations that are broken into smaller motions
//where some of the motion is delayed
  @override
  // ignore: library_private_types_in_public_api
  _StaggeredAnimationScreenState createState() =>
      _StaggeredAnimationScreenState();
}

class _StaggeredAnimationScreenState extends State<StaggeredAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _width;
  late Animation<double> _height;
  late Animation<EdgeInsets> _padding;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0, 0.2, // 0% to 20% of the animation
          curve: Curves.ease,
        ),
      ),
    );

    _width = Tween<double>(begin: 50.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.2, 0.5, // 20% to 50% of the animation
          curve: Curves.ease,
        ),
      ),
    );

    _height = Tween<double>(begin: 50.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.5, 0.8, // 50% to 80% of the animation
          curve: Curves.ease,
        ),
      ),
    );

    _padding = EdgeInsetsTween(
      begin: const EdgeInsets.only(top: 0.0),
      end: const EdgeInsets.only(top: 100.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.8, 1.0, // 80% to 100% of the animation
          curve: Curves.ease,
        ),
      ),
    );

    _controller.forward();
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
        title: const Text('Staggered Animation'),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Center(
            child: Container(
              padding: _padding.value,
              alignment: Alignment.center,
              child: Opacity(
                opacity: _opacity.value,
                child: Container(
                  width: _width.value,
                  height: _height.value,
                  color: Colors.blue,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
