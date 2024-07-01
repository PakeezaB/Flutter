import 'package:flutter/material.dart';

/// Flutter code sample for [AbsorbPointer].

class AbsorbPointerApp extends StatelessWidget {
  const AbsorbPointerApp({super.key});

//A widget that absorbs pointers during hit testing.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AbsorbPointer Sample')),
        body: const Center(
          child: AbsorbPointerExample(),
        ),
      ),
    );
  }
}

class AbsorbPointerExample extends StatelessWidget {
  const AbsorbPointerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 100.0,
          child: ElevatedButton(
            onPressed: () {},
            child: null,
          ),
        ),
        SizedBox(
          width: 100.0,
          height: 200.0,
          child: AbsorbPointer(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade200,
              ),
              onPressed: () {},
              child: null,
            ),
          ),
        ),
      ],
    );
  }
}
