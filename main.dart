import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice_app/counter_screen.dart';
import 'counter.dart';

void main() {
  runApp(
    MultiProvider //allows providing multiple instances at once
        //helps in managing complex state
        (
      providers: [
        ChangeNotifierProvider(create: (context) => Counter()),
        //provides an instance of a class(usually chnage notifire) to its descendent
        //it listens to the instance and then rebuilt the widget tree
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterScreen(),
    );
  }
}
