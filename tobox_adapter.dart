import 'package:flutter/material.dart';

class ToBoxAdapterWidget extends StatelessWidget {
  final List<String> items = List.generate(50, (index) => 'Item $index');

  ToBoxAdapterWidget({super.key});

//A sliver that contains a single box widget.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('SliverToBoxAdapter Example'),
                // background: Image.network(
                //   'https://via.placeholder.com/500x200',
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.blue,
                height: 100.0,
                alignment: Alignment.center,
                child: const Text(
                  'Non-scrollable Box',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text(items[index]),
                  );
                },
                childCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
