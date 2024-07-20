import 'package:flutter/material.dart';

class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedSwitcherExampleState createState() =>
      _AnimatedSwitcherExampleState();
}

//used to animate between different widgets

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  bool _isFirstTextVisible = true;

  void _toggleText() {
    setState(() {
      _isFirstTextVisible = !_isFirstTextVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSwitcher Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: _isFirstTextVisible
                  ? const Text(
                      'First Text',
                      key: ValueKey<int>(1),
                      style: TextStyle(fontSize: 24),
                    )
                  : const Text(
                      'Second Text',
                      key: ValueKey<int>(2),
                      style: TextStyle(fontSize: 24),
                    ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleText,
              child: const Text('Toggle Text'),
            ),
          ],
        ),
      ),
    );
  }
}
