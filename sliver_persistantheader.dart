import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

//A sliver whose size varies when the sliver is scrolled to the edge of the viewport opposite the sliver's GrowthDirection.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Persistent Header Example'),
                // background: Image.network(
                //   'https://via.placeholder.com/500x200',
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60.0;
  @override
  double get maxExtent => 60.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text(
        'Persistent Header',
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
