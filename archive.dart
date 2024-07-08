import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArchiveScreen extends StatelessWidget {
  final List<Map<String, dynamic>> archivedTasks;

  const ArchiveScreen({super.key, required this.archivedTasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Archived Tasks',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu), // Menu icon
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen
          },
        ),
        actions: [
          CupertinoButton(
            onPressed: () {
              // Handle Cupertino icon tap
            },
            child: const Icon(CupertinoIcons.bell), // Cupertino icon
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 6),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: archivedTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(archivedTasks[index]['title'] ?? ''),
            subtitle: Text(archivedTasks[index]['details'] ?? ''),
          );
        },
      ),
    );
  }
}
