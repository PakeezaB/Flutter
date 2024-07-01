import 'package:flutter/material.dart';

class KeyboardApp extends StatelessWidget {
  const KeyboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: KeyboardListenerExample(),
    );
  }
}

class KeyboardListenerExample extends StatefulWidget {
  const KeyboardListenerExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _KeyboardListenerExampleState createState() =>
      _KeyboardListenerExampleState();
}

class _KeyboardListenerExampleState extends State<KeyboardListenerExample> {
  final FocusNode _focusNode = FocusNode();
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isKeyboardVisible = _focusNode.hasFocus;
    });
    //print('Keyboard visible: $_isKeyboardVisible');
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keyboard Listener Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tap the TextField to see keyboard events',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              focusNode: _focusNode,
              decoration: const InputDecoration(
                hintText: 'Tap here',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _isKeyboardVisible
                  ? 'Keyboard is visible'
                  : 'Keyboard is not visible',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
