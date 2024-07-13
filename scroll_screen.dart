import 'package:flutter/material.dart';

class ScrollScreen extends StatefulWidget {
  const ScrollScreen({super.key});
//Flutter can remember their state when navigating back to the screen(testfields,lists,etc)

  @override
  // ignore: library_private_types_in_public_api
  _ScrollScreenState createState() => _ScrollScreenState();
}

class _ScrollScreenState extends State<ScrollScreen> {
  final PageStorageKey _key = const PageStorageKey('scroll_screen_key');
  List<String> items = List.generate(50, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll Screen'),
      ),
      body: ListView.builder(
        key: _key, // Assigning PageStorageKey to ListView
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
