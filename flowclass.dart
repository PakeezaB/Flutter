import 'package:flutter/material.dart';

class FlowClassWidget extends StatelessWidget {
  const FlowClassWidget({super.key});

//A widget that implements the flow layout algorithm.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flow Example'),
      ),
      body: Flow(
        delegate: SimpleFlowDelegate(margin: const EdgeInsets.all(10)),
        children: List.generate(10, (index) {
          return Container(
            width: 80,
            height: 80,
            color: Colors.primaries[index % Colors.primaries.length],
          );
        }),
      ),
    );
  }
}

class SimpleFlowDelegate extends FlowDelegate {
  final EdgeInsets margin;

  SimpleFlowDelegate({required this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    double x = margin.left;
    double y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      final w = context.getChildSize(i)!.width + x + margin.right;
      if (w <= context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return const Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
