import 'package:flutter/material.dart';

class Myreadingpage extends StatelessWidget {
  const Myreadingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: const Text('Book Web '),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body:
          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('حالم',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times new roman',
                color: Colors.black)),
        SizedBox(height: 20), // Adding some space between text and image
      ]),
    );
  }
}
