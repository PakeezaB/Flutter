import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LifecycleExample(),
    );
  }
}

class LifecycleExample extends StatefulWidget {
  @override
  _LifecycleExampleState createState() => _LifecycleExampleState();
}

class _LifecycleExampleState extends State<LifecycleExample> {
  @override
  void initState() {
    super.initState();
    print("initState called");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies called");
  }

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
      appBar: AppBar(
        title: Text("Lifecycle Example"),
      ),
      body: Center(
        child: Text("Check console for lifecycle logs"),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant LifecycleExample oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget called");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate called");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose called");
  }
}
