import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

class CounterDetailsScreen extends StatelessWidget {
  const CounterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Current counter value is:'),
            Text(
              '${counter.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
