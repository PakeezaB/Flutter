import 'package:flutter/material.dart'; //contains widgets and utilities for building apps
import 'package:widgets_task01_app/readme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(
      BuildContext
          context) //returns MaterialApp widget, which represents the root of your application.
  {
    return const MaterialApp(
      title: 'Book web',
      home: MyBookApp(), //Sets MyBookApp as the home (or initial) route
    );
  }
}

class MyBookApp extends StatelessWidget {
  const MyBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //provides APIs for showing drawers and bottom sheets
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: const Text('Book Web '),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Column(
        //arranges choldren vertucally
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('حالم',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Times new roman',
                  color: Colors.black)),
          const SizedBox(
              height: 20), // Adding some space between text and image
          Row(
            //arranges horizontally
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container //Creates a widget that combines common painting, positioning, and sizing widgets.
                  (
                margin: const EdgeInsets.all(
                    0), //sets margin arriund container to zero for all sides

                //EdgeInsets is a class in Flutter used to describe offsets (or margins/padding) from the edges of a box.
                width: 150,
                height: 300,
                child: Image.network(
                  'https://th.bing.com/th/id/OIP.ClO26FXtfAfZ4Ak2JlOxDAAAAA?w=350&h=500&rs=1&pid=ImgDetMain',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Myreadingpage()));
            },
            child: const Text('Read me'),
          ),

          const FlutterLogo(
            size: 100,
            style: FlutterLogoStyle.markOnly,
            curve: Curves.bounceInOut,
            duration: Duration(seconds: 12),
          ),

          const Placeholder(
            //widget that draws a box that represents where other widgets will one day be added
            fallbackHeight: 50.0,
            fallbackWidth: 80.0,
          ),
        ],
      ),
    );
  }
}
