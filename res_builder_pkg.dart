import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

//provides a set of utilities to make your app responsive easily

class ResponsiveBuilderExample extends StatelessWidget {
  const ResponsiveBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Builder")),
      // ignore: deprecated_member_use
      body: ScreenTypeLayout(
        mobile: const MobileLayout(),
        tablet: const TabletLayout(),
        desktop: const DesktopLayout(),
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Mobile Layout'));
  }
}

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Tablet Layout'));
  }
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Desktop Layout'));
  }
}
