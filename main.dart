import 'package:adaptive_and_responsive_app/focus_screen.dart';
import 'package:adaptive_and_responsive_app/safe_area.dart';
import 'package:adaptive_and_responsive_app/scroll_screen.dart';
import 'package:flutter/material.dart';
import 'aspect_ratio.dart';
import 'relative_units.dart';
import 'grid_view.dart';
import 'layout_builder.dart';
import 'mediaquery.dart';
import 'orientation_builder.dart';
import 'platform_spec_widgets.dart';
import 'res_builder_pkg.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/mediaquery': (context) => const ResponsiveWidget(),
        '/layoutbuilder': (context) => const AdaptiveLayout(),
        '/orientationbuilder': (context) => const OrientationExample(),
        '/platformspecificwidgets': (context) => const PlatformSpecificWidget(),
        '/resbuilderpackage': (context) => const ResponsiveBuilderExample(),
        '/gridview': (context) => const ResponsiveGrid(),
        '/aspectratio': (context) => const AspectRatioScreen(),
        '/relativeunits': (context) => const RelativeUnitsScreen(),
        '/safearea': (context) => const SafeAreaScreen(),
        '/pagestoragekey': (context) => const ScrollScreen(),
        '/focusscreen': (context) => const FocusScreen(),
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
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/mediaquery');
                },
                child: const Text('MediaQuery Example'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/layoutbuilder');
                },
                child: const Text('LayoutBuilder Example'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/orientationbuilder');
                },
                child: const Text('OrientationBuilder Example'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/platformspecificwidgets');
                },
                child: const Text('Platform-Specific Widgets'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/resbuilderpackage');
                },
                child: const Text('Responsive Builder Package'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gridview');
                },
                child: const Text('Responsive Grid'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/aspectratio');
                },
                child: const Text('AspectRatio Example'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/relativeunits');
                },
                child: const Text('Relative Units Example'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/safearea');
                },
                child: const Text('SafeArea Example'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pagestoragekey');
                },
                child: const Text('Page storage key'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/focusscreen');
                },
                child: const Text('Focus Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
