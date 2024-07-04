import 'package:flutter/material.dart';

class MyReadingPage extends StatelessWidget {
  final String bookTitle;
  final String characterName;

  const MyReadingPage(
      {super.key, required this.characterName, required this.bookTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            Scaffold.of(context).openDrawer();
            // gets the Scaffold widget that is above in the widget tree and calls its openDrawer method to open the drawer.
          },
        ),
        title: Text(bookTitle),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centers the column vertically
          children: [
            Text(
              'Character: $characterName',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20), // Adding some space between the texts
            const Text(
              'انسان کو کوئی چیز نہیں ہرا سکتی جب تک وہ خود ہار نہ مان لے',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20), // Adding some space between the texts
            const Text(
              'جو ہمیں معلوم ہوتا ہے چاہے تالیہ وہ ہمیشہ ہماری جان بچاتاہے',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20), // Adding space before the button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Pops the current route off the navigator stack, returning to the previous screen
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
