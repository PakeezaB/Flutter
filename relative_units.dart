import 'package:flutter/material.dart';

//create flexible and adaptive layouts
//that adjust to different screen sizes and orientations
class RelativeUnitsScreen extends StatelessWidget {
  const RelativeUnitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relative Units Example'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth * 0.5,
              height: constraints.maxHeight * 0.5,
              color: Colors.green,
              child: const Center(
                child: Text(
                  '50% of Screen',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
