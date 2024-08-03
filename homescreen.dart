import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final Function(ThemeMode) setThemeMode;

  const MyHomePage({
    super.key,
    required this.title,
    required this.setThemeMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to $title!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setThemeMode(ThemeMode.light);
              },
              child: const Text('Light Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                setThemeMode(ThemeMode.dark);
              },
              child: const Text('Dark Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                setThemeMode(ThemeMode.system);
              },
              child: const Text('System Theme'),
            ),
            const Text('This is my multi themed app')
          ],
        ),
      ),
    );
  }
}
