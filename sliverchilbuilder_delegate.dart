import 'package:flutter/material.dart';

class ChildBuilderWidget extends StatelessWidget {
  const ChildBuilderWidget({super.key});

  static const SliverGridDelegate _gridDelegate =
      SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
  );

//A delegate that supplies children for slivers using a builder callback.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        semanticChildCount: 4,
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: _gridDelegate,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.blueAccent,
                  alignment: Alignment.center,
                  child: Text('Item $index'),
                );
              },
              childCount: 2,
            ),
          ),
          SliverGrid(
            gridDelegate: _gridDelegate,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.greenAccent,
                  alignment: Alignment.center,
                  child: Text('Item ${index + 2}'),
                );
              },
              childCount: 2,
              semanticIndexOffset: 2,
            ),
          ),
        ],
      ),
    );
  }
}
