import 'package:flutter/material.dart';
import 'package:sliver_widgets_task_app/appbar.dart';
import 'package:sliver_widgets_task_app/cupertino_navbar.dart';
import 'package:sliver_widgets_task_app/custom_scrollview.dart';
import 'package:sliver_widgets_task_app/sl_fixedextent_list.dart';
import 'package:sliver_widgets_task_app/sliver_padding.dart';
import 'package:sliver_widgets_task_app/sliver_persistantheader.dart';
import 'package:sliver_widgets_task_app/sliverchilbuilder_delegate.dart';
import 'package:sliver_widgets_task_app/slivergrid.dart';
import 'package:sliver_widgets_task_app/sliverlist.dart';
import 'package:sliver_widgets_task_app/tobox_adapter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomeScreen(), routes: {
      '/cupNavbar': (context) => const SliverNavBarExample(),
      '/scrollview': (context) => const CustomScrollViewExample(),
      '/sliverappbar': (context) => const appBarWidget(),
      '/childbuilderDelegate': (context) => const ChildBuilderWidget(),
      '/extentList': (context) => const ExtentListWidget(),
      '/sliverGrid': (context) => const SliverGridWidget(),
      '/sliverList': (context) => const SliverListWidget(),
      '/padding': (context) => const SliverPaddingWidget(),
      '/header': (constant) => const HeaderWidget(),
      '/toBoxAdapter': (context) => ToBoxAdapterWidget(),
    });
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliver Layout Widgets'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cupNavbar');
              },
              child: const Text('Cupertino sliver navbar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/scrollview');
              },
              child: const Text('Custom Scrollview'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sliverappbar');
              },
              child: const Text('Sliver appbar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/childbuilderDelegate');
              },
              child: const Text('Sliver ChildBuilder Delegate'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/extentList');
              },
              child: const Text('Extent List'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sliverGrid');
              },
              child: const Text('Sliver Grid'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sliverList');
              },
              child: const Text('Sliver List'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/padding');
              },
              child: const Text('Sliver Padding'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/header');
              },
              child: const Text('Sliver Persistant Header'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/toBoxAdapter');
              },
              child: const Text('Sliver ToBoAddapter'),
            ),
          ],
        ),
      ),
    );
  }
}
