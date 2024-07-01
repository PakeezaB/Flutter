import 'package:flutter/material.dart';

class OffstageExample extends StatefulWidget {
  const OffstageExample({super.key});

  @override
  State<OffstageExample> createState() => _OffstageExampleState();
}

class _OffstageExampleState extends State<OffstageExample> {
  final GlobalKey _key = GlobalKey();
  bool _offstage = true;

  Size? _getFlutterLogoSize() {
    final renderLogo = _key.currentContext?.findRenderObject() as RenderBox?;
    return renderLogo?.size;
  }

//A widget that lays the child out as if it was in the tree, but without painting anything, without making the child available for hit testing, and without taking any room in the parent.

//Offstage children are still active: they can receive focus and have keyboard input directed to them.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offstage Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Offstage(
              offstage: _offstage,
              child: FlutterLogo(
                key: _key,
                size: 150.0,
              ),
            ),
            Text('Flutter logo is offstage: $_offstage'),
            ElevatedButton(
              child: const Text('Toggle Offstage Value'),
              onPressed: () {
                setState(() {
                  _offstage = !_offstage;
                });
              },
            ),
            if (!_offstage)
              ElevatedButton(
                child: const Text('Get Flutter Logo size'),
                onPressed: () {
                  final size = _getFlutterLogoSize();
                  if (size != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Flutter Logo size is $size'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Flutter Logo size could not be determined'),
                      ),
                    );
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
      home: OffstageExample(),
    ));
