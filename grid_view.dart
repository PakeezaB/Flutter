import 'package:flutter/material.dart';

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Grid")),
      body: GridView.count(
        crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 4,
        children: List.generate(20, (index) {
          return Center(
            child: Text('Item $index'),
          );
        }),
      ),
    );
  }
}
