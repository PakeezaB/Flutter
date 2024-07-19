import 'package:flutter/material.dart';

class PreCannedAnimation extends StatefulWidget {
  const PreCannedAnimation({super.key});

// pub.dev package contains pre-built animations for commonly used patterns:
// Container transforms
// shared axis transitions
// fade through transitions,
// fade transitions.

  @override
  // ignore: library_private_types_in_public_api
  _PreCannedAnimationState createState() => _PreCannedAnimationState();
}

class _PreCannedAnimationState extends State<PreCannedAnimation> {
  bool _isExpanded = false;

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pre-Canned Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleContainer,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            width: _isExpanded ? 200 : 100,
            height: _isExpanded ? 200 : 100,
            color: _isExpanded ? Colors.blue : Colors.red,
            alignment:
                _isExpanded ? Alignment.center : AlignmentDirectional.topCenter,
            child: const FlutterLogo(size: 75),
          ),
        ),
      ),
    );
  }
}
