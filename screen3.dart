import "package:flutter/material.dart";

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen three"),
        backgroundColor: Colors.yellow.shade300,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                width: 200,
                height: 50.0,
                alignment: Alignment.center,
                color: const Color.fromARGB(149, 17, 218, 107),
                child: const Text("3rd screen"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
