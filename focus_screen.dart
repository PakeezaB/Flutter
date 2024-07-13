// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class FocusScreen extends StatelessWidget {
  const FocusScreen({super.key});
//Flutter can remember their state when navigating back to the screen(testfields,lists,etc)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FocusTraversalGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Focus(
                onFocusChange: (hasFocus) {
                  print('TextField 1 focused: $hasFocus');
                },
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Text Field 1'),
                ),
              ),
              const SizedBox(height: 20),
              Focus(
                onFocusChange: (hasFocus) {
                  print('TextField 2 focused: $hasFocus');
                },
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Text Field 2'),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Button'),
              ),
              const SizedBox(height: 20),
              Focus(
                onFocusChange: (hasFocus) {
                  print('Checkbox focused: $hasFocus');
                },
                child: CheckboxListTile(
                  title: const Text('Checkbox'),
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
