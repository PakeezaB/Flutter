import 'package:flutter/material.dart';

//build a different layout based on the
// device orientation (portrait or landscape).
class OrientationExample extends StatelessWidget {
  const OrientationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Orientation Builder")),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? const Column(
                  children: [
                    Text('Portrait mode'),
                    Icon(Icons.portrait),
                  ],
                )
              : const Row(
                  children: [
                    Text('Landscape mode'),
                    Icon(Icons.landscape),
                  ],
                );
        },
      ),
    );
  }
}
