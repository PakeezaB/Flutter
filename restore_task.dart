import 'package:flutter/material.dart';

class RestoreTaskScreen extends StatelessWidget {
  final Map<String, dynamic> taskToRestore;
  final VoidCallback onRestore;

  const RestoreTaskScreen({
    Key? key,
    required this.taskToRestore,
    required this.onRestore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restore Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskToRestore['title'] ?? '',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              taskToRestore['details'] ?? '',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: onRestore,
              child: const Text('Restore Task'),
            ),
          ],
        ),
      ),
    );
  }
}
