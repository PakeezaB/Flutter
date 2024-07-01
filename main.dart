import 'package:flutter/material.dart';
import 'package:interaction_model_widgets_app/absorb_pointer.dart';
import 'package:interaction_model_widgets_app/dismissibleclass.dart';
import 'package:interaction_model_widgets_app/draggable.dart';
import 'package:interaction_model_widgets_app/draggablescrollsheet.dart';
import 'package:interaction_model_widgets_app/gesturedetector.dart';
import 'package:interaction_model_widgets_app/hero.dart';
import 'package:interaction_model_widgets_app/ignore_pointer.dart';
import 'package:interaction_model_widgets_app/interactive_viewer.dart';
import 'package:interaction_model_widgets_app/navigator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      // Define the initial route
      initialRoute: '/',
      routes: {
        // Define the routes
        '/': (context) => const HomeScreen(),
        '/absorbpointer': (context) => const AbsorbPointerApp(),
        '/dismissibleClass': (context) => const DismissibleExampleApp(),
        '/draggable': (context) => const DraggableExampleApp(),
        '/draggablesheet': (context) =>
            const DraggableScrollableSheetExampleApp(),
        '/gesturedetector': (context) => const GestureDetectorExampleApp(),
        '/ignore_pointer': (context) => const IgnorePointerApp(),
        '/interactive': (context) => const InteractiveViewerExampleApp(),
        '/hero': (context) => const HeroApp(),
        '/navigator': (context) => const NavApp(),
        // '/absorbpointer': (context) => const AbsorbPointerApp(),
        // '/dismissibleClass': (context) => const DismissibleExampleApp(),
        // '/draggable': (context) => const DraggableExampleApp(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text('Input Widgets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Touch interactions'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/absorbpointer');
              },
              child: const Text('Absorb pointer'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dismissibleClass');
              },
              child: const Text('Dismissible Class'),
            ),
            const Text('Drag target'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/draggable');
              },
              child: const Text('Draggable'),
            ),
            const Text(
                'Long press draggable is similar as draggable it just includes long press'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/draggablesheet');
              },
              child: const Text('Draggable Scrollable Sheet'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/gesturedetector');
              },
              child: const Text('Gesture Detector'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ignore_pointer');
              },
              child: const Text('Ignore pointer'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/interactive');
              },
              child: const Text('Interactive Viewer class'),
            ),
            const Text(
                'Scrollable: A widget that manages scrolling in one dimension and informs the Viewport through which the content is viewed.'),
            const Text('Routing'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/hero');
              },
              child: const Text('Hero class'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/navigator');
              },
              child: const Text('Navigator class'),
            ),
          ],
        ),
      ),
    );
  }
}
