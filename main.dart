import 'package:flutter/material.dart';
import 'package:input_widgets_app/autocomplete.dart';
import 'package:input_widgets_app/form.dart';
import 'package:input_widgets_app/keyboardlistener.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define the initial route
      initialRoute: '/',
      routes: {
        // Define the routes
        '/': (context) => const HomeScreen(),
        '/autoComplete': (context) => const AutocompleteExample(),
        '/form': (context) => const FormExampleApp(),
        '/keyboardlistener': (context) => const KeyboardApp(),
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/autoComplete');
              },
              child: const Text('AutoComplete'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/form');
              },
              child: const Text('Form'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/keyboardlistener');
              },
              child: const Text('Keyboard Listener Class'),
            ),
          ],
        ),
      ),
    );
  }
}
