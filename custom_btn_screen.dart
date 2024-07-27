// ignore_for_file: library_private_types_in_public_api

import 'package:custom_widgets_app/custom_btn.dart';
import 'package:flutter/material.dart';

class CustomButtonScreen extends StatefulWidget {
  const CustomButtonScreen({super.key});

  @override
  _CustomButtonScreenState createState() => _CustomButtonScreenState();
}

class _CustomButtonScreenState extends State<CustomButtonScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();

  String buttonText = 'Click Me';
  Color buttonColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Button Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(labelText: 'Button Text'),
            ),
            TextField(
              controller: _colorController,
              decoration:
                  const InputDecoration(labelText: 'Button Color (hex)'),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: buttonText,
              color: buttonColor,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button Pressed!')),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttonText = _textController.text;
                  buttonColor =
                      Color(int.parse(_colorController.text, radix: 16));
                });
              },
              child: const Text('Update Button'),
            ),
          ],
        ),
      ),
    );
  }
}
