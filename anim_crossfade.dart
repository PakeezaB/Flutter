import 'package:flutter/material.dart';

class CrossFadeTransitionScreen extends StatefulWidget {
  const CrossFadeTransitionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CrossFadeTransitionScreenState createState() =>
      _CrossFadeTransitionScreenState();
}

class _CrossFadeTransitionScreenState extends State<CrossFadeTransitionScreen> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CrossFade Transition'),
      ),
      body: Center(
        child: AnimatedCrossFade(
          duration: const Duration(seconds: 2),
          firstChild: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
          secondChild: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
          crossFadeState:
              _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showFirst = !_showFirst;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
