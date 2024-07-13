import 'package:flutter/material.dart';

//provides information about the size, orientation,
// and other properties of the current screen
class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(title: const Text("Media query example")),
      body: orientation == Orientation.portrait
          ? Column(
              children: [
                Text('Screen width: ${screenSize.width}'),
                Text('Screen height: ${screenSize.height}'),
              ],
            )
          : Row(
              children: [
                Text('Screen width: ${screenSize.width}'),
                Text('Screen height: ${screenSize.height}'),
              ],
            ),
    );
  }
}
