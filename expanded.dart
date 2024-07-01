import 'package:flutter/material.dart';

class ExpandedClass extends StatelessWidget {
  const ExpandedClass({super.key});
//A widget that expands a child of a Row, Column, or Flex so that the child fills the available space.

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.teal,
            height: 100,
            width: 100,
          ),
          Expanded(
            child: Container(
              color: Colors.purpleAccent,
              width: 100,
            ),
          ),
          Container(
            color: Colors.blueGrey,
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
  }
}
