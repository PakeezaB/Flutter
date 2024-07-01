import 'package:flutter/material.dart';

class appBarWidget extends StatelessWidget {
  const appBarWidget({super.key});
//A Material Design app bar that integrates with a CustomScrollView.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Available seats'),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_circle),
                tooltip: 'Add new entry',
                onPressed: () {
                  // Add your onPressed code here!
                },
              ),
            ],
          ),
          const SliverFillRemaining(
            child: Center(
              child: Text('Content goes here'),
            ),
          ),
        ],
      ),
    );
  }
}
