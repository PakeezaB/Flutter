import "package:flutter/material.dart";

class AutocompleteExample extends StatefulWidget {
  const AutocompleteExample({super.key});

//A widget for helping the user make a selection by entering some text and choosing from among a list of options.
  @override
  // ignore: library_private_types_in_public_api
  _AutocompleteExampleState createState() => _AutocompleteExampleState();
}

class _AutocompleteExampleState extends State<AutocompleteExample> {
  final List<String> options = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grape',
    'Honeydew',
    'Kiwi',
    'Lemon',
    'Mango',
    'Nectarine',
    'Orange',
    'Peach',
    'Quince',
    'Raspberry',
    'Strawberry',
    'Tangerine',
    'Ugli fruit',
    'Vanilla bean',
    'Watermelon',
    'Xigua melon',
    'Yuzu',
    'Zucchini',
  ];

  final TextEditingController _controller = TextEditingController();
  String _selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autocomplete Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Search fruits...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            _selectedOption.isNotEmpty
                ? Expanded(
                    child: ListView(
                      children: options
                          .where((option) => option
                              .toLowerCase()
                              .contains(_selectedOption.toLowerCase()))
                          .map((option) => ListTile(
                                title: Text(option),
                                onTap: () {
                                  setState(() {
                                    _controller.text = option;
                                    _selectedOption = option;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
