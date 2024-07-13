import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//Flutter allows to use different widgets based on the platform (iOS, Android, Web, etc.).
class PlatformSpecificWidget extends StatelessWidget {
  const PlatformSpecificWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("iOS Style"),
        ),
        child: Center(child: Text('This is iOS')),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text("Android Style")),
        body: const Center(child: Text('This is Android')),
      );
    }
  }
}
