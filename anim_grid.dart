import 'package:flutter/material.dart';

class AnimatedGridScreen extends StatefulWidget {
  const AnimatedGridScreen({super.key});

//removal of elements from a grid

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedGridScreenState createState() => _AnimatedGridScreenState();
}

class _AnimatedGridScreenState extends State<AnimatedGridScreen> {
  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.cyan,
    Colors.amber
  ];
  final List<bool> _selected = List.generate(7, (index) => false);

  void _toggleSelection(int index) {
    setState(() {
      _selected[index] = !_selected[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Grid'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          itemCount: _colors.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _toggleSelection(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: _colors[index],
                  borderRadius:
                      BorderRadius.circular(_selected[index] ? 16.0 : 4.0),
                  border: Border.all(
                    color: _selected[index] ? Colors.black : Colors.transparent,
                    width: _selected[index] ? 3.0 : 0.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Item $index',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
