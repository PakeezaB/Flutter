import 'package:flutter/material.dart';
import 'package:implicit_aimation_app/anim_curve.dart';
import 'package:implicit_aimation_app/anim_padding.dart';
import 'package:implicit_aimation_app/anim_pos.dart';
import 'package:implicit_aimation_app/anim_switcher.dart';
import 'package:implicit_aimation_app/animated_opac.dart';
import 'package:implicit_aimation_app/shape_shifting.dart';
import 'fade_in_text.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Implicit animations'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FadeInTextScreen()),
                );
              },
              child: const Text('Fade In Text Animation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShapeShiftingHomePage()),
                );
              },
              child: const Text('Shape shifting Animation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimationCurveHomePage()),
                );
              },
              child: const Text('Animation Curve'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimatedOpacityExample()),
                );
              },
              child: const Text('AnimatedOpacity Widget'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimatedPaddingDemo()),
                );
              },
              child: const Text('AnimatedPadding Widget'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimatedPositionedExample()),
                );
              },
              child: const Text('AnimatedPositioned Widget'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimatedSwitcherExample()),
                );
              },
              child: const Text('Animated Switcher'),
            ),
          ],
        ),
      ),
    );
  }
}
