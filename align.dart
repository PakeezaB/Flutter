import 'package:flutter/material.dart';

class Alignwidget extends StatelessWidget {
  const Alignwidget({super.key});

//widget that aligns its child within itself and optionally sizes itself based on the child's size.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Align widget'),
      ),
      body: Center(
        //creates widget that centres it child
        child: Container(
          height: 200,
          width: 200,
          color: const Color.fromARGB(255, 177, 197, 207),
          child: const Align(
              alignment: Alignment.topRight,
              child: FlutterLogo(
                size: 80,
              )),
        ),
      ),
    );
  }
}
