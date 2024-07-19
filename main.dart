import 'package:animations_app/anim_grid.dart';
import 'package:animations_app/anim_list.dart';
import 'package:animations_app/physicsrel_anim.dart';
import 'package:animations_app/pre_canned.dart';
import 'package:animations_app/staggered_anim.dart';
import 'package:flutter/material.dart';
import 'tween_anim.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tween Animation Example',
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
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimationScreen()),
                );
              },
              child: const Text('Tween Animation'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PhysicsAnimationScreen()),
                );
              },
              child: const Text('Physics based Animation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PreCannedAnimation()),
                );
              },
              child: const Text('Pre-Canned animation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimatedListScreen()),
                );
              },
              child: const Text('Animated list'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimatedGridScreen()),
                );
              },
              child: const Text('Animated grid'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StaggeredAnimationScreen()),
                );
              },
              child: const Text('Staggered Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
