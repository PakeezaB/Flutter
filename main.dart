import 'package:flutter/material.dart';
import 'package:layout_widgets_task_app/conatiner.dart';
import 'package:layout_widgets_task_app/constrained_box.dart';
import 'package:layout_widgets_task_app/align.dart';
import 'package:layout_widgets_task_app/aspectratio.dart';
import 'package:layout_widgets_task_app/baseline.dart';
import 'package:layout_widgets_task_app/expanded.dart';
import 'package:layout_widgets_task_app/fitted_box.dart';
import 'package:layout_widgets_task_app/fractionally_sizedbox.dart';
import 'package:layout_widgets_task_app/intrinsicheight.dart';
import 'package:layout_widgets_task_app/intrinsicwidth.dart';
import 'package:layout_widgets_task_app/limitedbox.dart';
import 'package:layout_widgets_task_app/offstage.dart';
import 'package:layout_widgets_task_app/overflowBox.dart';
import 'package:layout_widgets_task_app/padding.dart';
import 'package:layout_widgets_task_app/sizedbox.dart';
import 'package:layout_widgets_task_app/sizedoverflowbox.dart';
import 'package:layout_widgets_task_app/transform.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomeScreen(), routes: {
      '/container': (context) => const ContainerWidget(),
      '/align': (context) => const Alignwidget(),
      '/aspectRatio': (context) => const AspectRatiowidget(),
      '/baseline': (context) => const BaselineClass(),
      '/ConstrainedBox': (context) => const ConsBoxWidget(),
      '/expamdedclass': (context) => const ExpandedClass(),
      '/fittedBoxclass': (context) => const FittedBoxWidget(),
      '/fractionallySizedBox': (context) => const FractionallyWidget(),
      '/offStageExample': (constant) => const OffstageExample(),
      '/overflowBox': (context) => const OverFlowBoxWidget(),
      '/paddingex': (context) => const paddingExample(),
      '/sizedbox': (context) => const SizedBoxWidget(),
      '/overflowsizedBox': (context) => const OverflowSizedBox(),
      '/transformex': (context) => const transformwidget(),
      '/IntrinsicWidth': (context) => IntrinsicWidthWidget(),
      '/Instrinsicheight': (context) => const IntrinsicheightWidget(),
      '/LimitedBox': (context) => const LimitedBoxWidget(),
    });
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Widgets'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/container');
              },
              child: const Text('Conatiner'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/align');
              },
              child: const Text('Align class'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/aspectRatio');
              },
              child: const Text('Aspect Ratio'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/baseline');
              },
              child: const Text('Baseline'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ConstrainedBox');
              },
              child: const Text('Constrained Box'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/expamdedclass');
              },
              child: const Text('Expanded class'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fittedBoxclass');
              },
              child: const Text('Fitted Box class'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fractionallySizedBox');
              },
              child: const Text('Fractionally Box class'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/IntrinsicWidth');
              },
              child: const Text('Intrinsic width'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Instrinsicheight');
              },
              child: const Text('Intrinsic height'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/LimitedBox');
              },
              child: const Text('Limited Box'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/offStageExample');
              },
              child: const Text('Off Stage Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/overflowBox');
              },
              child: const Text('Overflow Box'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/paddingex');
              },
              child: const Text('Padding'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sizedbox');
              },
              child: const Text('Sized Box'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/overflowsizedBox');
              },
              child: const Text('Overflow Sized Box'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/transformex');
              },
              child: const Text('transform'),
            ),
          ],
        ),
      ),
    );
  }
}
