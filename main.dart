import 'package:explicit_animation_app/anim_crossfade.dart';
import 'package:explicit_animation_app/fade_trans.dart';
import 'package:explicit_animation_app/hero_anim.dart';
import 'package:explicit_animation_app/photo_hero.dart';
import 'package:explicit_animation_app/photo_trans.dart';
import 'package:explicit_animation_app/radial_exp.dart';
import 'package:explicit_animation_app/rotation_trans.dart';
import 'package:explicit_animation_app/scale_trans.dart';
import 'package:explicit_animation_app/slide_transition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Animations Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero and explicit Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PhotoScreen()),
                );
              },
              child: const Text('Photo Animation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HeroAnimationScreen()),
                );
              },
              child: const Text('Hero Animation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RadialExpansionScreen()),
                );
              },
              child: const Text('Radial Expansion'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PositionedTransitionScreen()),
                );
              },
              child: const Text('Positioned transition'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FadeTransitionScreen()),
                );
              },
              child: const Text('Fade transition'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CrossFadeTransitionScreen()),
                );
              },
              child: const Text('CrossFade transition'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScaleTransitionScreen()),
                );
              },
              child: const Text('Scale transition'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SlideTransitionScreen()),
                );
              },
              child: const Text('Slide transition'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RotationTransitionScreen()),
                );
              },
              child: const Text('Rotation transition'),
            ),
          ],
        ),
      ),
    );
  }
}
