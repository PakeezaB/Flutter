import "package:flutter/material.dart";
import "package:routes_appp2/routenames.dart";

class Routing extends StatelessWidget {
  const Routing({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: FirstScreen());
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("1st Screen"),
          backgroundColor: Colors.yellow.shade300,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.secondScreen,
                    arguments: {
                      "Name": "Pakeeza",
                      "Reg no": "034",

                      // different datatypes can be included
                      // Routes():Container()
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  width: 200,
                  height: 50.0,
                  alignment: Alignment.center,
                  color: Colors.greenAccent,
                  child: const Text("1st screen"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
