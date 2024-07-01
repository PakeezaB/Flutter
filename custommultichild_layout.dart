import 'package:flutter/material.dart';

class CustomMultichildWidget extends StatelessWidget {
  const CustomMultichildWidget({super.key});

//A widget that uses a delegate to size and position multiple children.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomMultiChildLayout(
        delegate: MyCustomLayoutDelegate(),
        children: <Widget>[
          LayoutId(
            id: 1,
            child: Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
          ),
          LayoutId(
            id: 2,
            child: Container(
              color: Colors.green,
              width: 150,
              height: 150,
            ),
          ),
          LayoutId(
            id: 3,
            child: Container(
              color: Colors.blue,
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    if (hasChild(1)) {
      // Position the first child at the top-left corner
      layoutChild(1, BoxConstraints.loose(size));
      positionChild(1, const Offset(0, 0));
    }

    if (hasChild(2)) {
      // Position the second child at the center
      final Size firstChildSize = layoutChild(2, BoxConstraints.loose(size));
      positionChild(
          2,
          Offset((size.width - firstChildSize.width) / 2,
              (size.height - firstChildSize.height) / 2));
    }

    if (hasChild(3)) {
      // Position the third child at the bottom-right corner
      final Size thirdChildSize = layoutChild(3, BoxConstraints.loose(size));
      positionChild(
          3,
          Offset(size.width - thirdChildSize.width,
              size.height - thirdChildSize.height));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
