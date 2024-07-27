import 'package:flutter/material.dart';
import 'custom_card.dart';

class CustomCardScreen extends StatefulWidget {
  const CustomCardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomCardScreenState createState() => _CustomCardScreenState();
}

class _CustomCardScreenState extends State<CustomCardScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();

  String cardTitle = 'Card Title';
  String cardContent = 'Card Content';
  Color cardColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Card Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Card Title'),
            ),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'Card Content'),
            ),
            TextField(
              controller: _colorController,
              decoration: const InputDecoration(labelText: 'Card Color (hex)'),
            ),
            const SizedBox(height: 20),
            CustomCard(
              title: cardTitle,
              content: cardContent,
              color: cardColor,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  cardTitle = _titleController.text;
                  cardContent = _contentController.text;
                  cardColor =
                      Color(int.parse(_colorController.text, radix: 16));
                });
              },
              child: const Text('Update Card'),
            ),
          ],
        ),
      ),
    );
  }
}
