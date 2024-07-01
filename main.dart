import 'package:flutter/material.dart';

import 'package:multi_childlayout_widgets_task_app/column.dart';
import 'package:multi_childlayout_widgets_task_app/custommultichild_layout.dart';
import 'package:multi_childlayout_widgets_task_app/flowclass.dart';
import 'package:multi_childlayout_widgets_task_app/gridview.dart';
import 'package:multi_childlayout_widgets_task_app/indexed_stack.dart';
import 'package:multi_childlayout_widgets_task_app/layoutbuilder.dart';
import 'package:multi_childlayout_widgets_task_app/listview.dart';
import 'package:multi_childlayout_widgets_task_app/row.dart';
import 'package:multi_childlayout_widgets_task_app/stack.dart';
import 'package:multi_childlayout_widgets_task_app/table.dart';
import 'package:multi_childlayout_widgets_task_app/wrap.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomeScreen(), routes: {
      '/column': (context) => const ColumnWidget(),
      '/custom': (context) => const CustomMultichildWidget(),
      '/flowclass': (context) => const FlowClassWidget(),
      '/gridview': (context) => const GridviewWidget(),
      '/indexedStack': (context) => const IndexedStackExample(),
      '/layoutBuilder': (context) => const LayoutBuilderExample(),
      '/listview': (context) => const ListViewWidget(),
      '/row': (context) => const RowWidget(),
      '/stack': (constant) => const StackWidget(),
      '/table': (context) => const TableExample(),
      '/wrap': (context) => const WrapWidget(),
      // '/sizedbox': (context) => const SizedBoxWidget(),
      // '/overflowsizedBox': (context) => const OverflowSizedBox(),
      // '/transformex': (context) => const transformwidget(),
      // '/IntrinsicWidth': (context) => IntrinsicWidthWidget(),
      // '/Instrinsicheight': (context) => const IntrinsicheightWidget(),
      // '/LimitedBox': (context) => const LimitedBoxWidget(),
    });
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Child Layout Widgets'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/column');
              },
              child: const Text('Column Widget'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/custom');
              },
              child: const Text('Custom Multi Child Widget'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/flowclass');
              },
              child: const Text('Flow Class Widget'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/gridview');
              },
              child: const Text('GridView Widget'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/indexedStack');
              },
              child: const Text('Indexed Stack'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/layoutBuilder');
              },
              child: const Text('Layout Builder'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/listview');
              },
              child: const Text('ListView class'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/row');
              },
              child: const Text('Row'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stack');
              },
              child: const Text('Stack'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/table');
              },
              child: const Text('Table'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/wrap');
              },
              child: const Text('Wrap'),
            ),
          ],
        ),
      ),
    );
  }
}
