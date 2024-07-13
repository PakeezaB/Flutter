import 'package:flutter/material.dart';

//allows you build widgets based on the constraints provided by its parent

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adaptive Layout")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return const Column(
              children: [
                Text('This is a small screen'),
                Icon(Icons.phone_android),
              ],
            );
          } else {
            return const Row(
              children: [
                Text('This is a large screen'),
                Icon(Icons.desktop_windows),
              ],
            );
          }
        },
      ),
    );
  }
}
