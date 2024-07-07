import "package:flutter/material.dart";
import 'package:routes_appp2/routenames.dart';

// ignore: must_be_immutable
class SecondScreen extends StatefulWidget {
  // Here too we can take data as Map

  // dynamic data;
  Map data;
  SecondScreen({super.key, required this.data});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data["Name"].toString()),
        backgroundColor: Colors.yellow.shade300,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.thirdScreen);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                width: 200,
                height: 50.0,
                alignment: Alignment.center,
                color: Colors.amber,
                child: Text("2nd Screen ${widget.data['Name']}"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
