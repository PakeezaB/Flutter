import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class FadeInTextScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _FadeInTextScreenState createState() => _FadeInTextScreenState();
}

//design tool that enhances
//usability
//aesthetics
//overall user experience

class _FadeInTextScreenState extends State<FadeInTextScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeIn,
    );

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade In Text Animation'),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animation!,
          child: const Text(
            'Hello, Flutter!',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
