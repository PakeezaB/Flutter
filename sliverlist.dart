import 'package:flutter/material.dart';

class SliverListWidget extends StatelessWidget {
  const SliverListWidget({super.key});

//A sliver that places multiple box children in a linear array along the main axis.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: Text('Sliver List Example'),
            floating: true,
            //  flexibleSpace: Placeholder(),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 80,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Center(
                    child: Text('Item $index'),
                  ),
                );
              },
              childCount: 20, // Set the number of items in the list
            ),
          ),
        ],
      ),
    );
  }
}
