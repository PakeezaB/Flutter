import 'package:flutter/material.dart';

//Using Row and Column widgets with Expanded
// and Flexible children can help distribute space evenly and adapt to different screen sizes
class FlexLayout extends StatelessWidget {
  const FlexLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flex Layout(with row or column)")),
      body: Column(
        children: [
          Expanded(
            child: Container(color: Colors.red),
          ),
          Expanded(
            child: Container(color: Colors.green),
          ),
          Expanded(
            child: Container(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
