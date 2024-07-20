import 'package:flutter/material.dart';

class ShapeShiftingHomePage extends StatefulWidget {
  const ShapeShiftingHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShapeShiftingHomePageState createState() => _ShapeShiftingHomePageState();
}

//transforming one shape or object into another smoothly

class _ShapeShiftingHomePageState extends State<ShapeShiftingHomePage> {
  bool isSquare = true;

  void _toggleShape() {
    setState(() {
      isSquare = !isSquare;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shape Shifting Demo'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleShape,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
