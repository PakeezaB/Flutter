import 'package:flutter/material.dart';

class HeroAnimationScreen extends StatelessWidget {
  const HeroAnimationScreen({super.key});

//provide a smooth and visually appealing way
//to transition between screens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HeroDetailScreen(),
            ),
          );
        },
        child: const Center(
          child: Hero(
            tag: 'iconHero',
            child: Icon(
              Icons.star,
              size: 50,
              color: Colors.yellow,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDetailScreen extends StatelessWidget {
  const HeroDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Detail'),
      ),
      body: const Center(
        child: Hero(
          tag: 'iconHero',
          child: Icon(
            Icons.star,
            size: 150,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
