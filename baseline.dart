import 'package:flutter/material.dart';

class BaselineClass extends StatelessWidget {
  const BaselineClass({super.key});

//Creates a widget that positions its child according to the child's baseline.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        color: Colors.amberAccent,
        width: 200,
        height: 200,
        child: const Baseline(
          baseline: 100,
          baselineType: TextBaseline.ideographic,
          // ^
          //|
          //Alphabetic
          //ideographic
          child: FlutterLogo(
            size: 50,
          ),
          // child: Text('Baseline حالم'),
        ),
      )),
    );
  }
}
