import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function(String, String) onSubmit;
  final String? title;
  final String? details;

  AddTaskScreen({Key? key, required this.onSubmit, this.title, this.details})
      : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      titleController.text = title!;
    }
    if (details != null) {
      detailsController.text = details!;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: detailsController,
              decoration: const InputDecoration(labelText: 'Details'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text;
                final details = detailsController.text;
                onSubmit(title, details);
                // Removed Navigator.pop(context) to keep the screen open
              },
              child: const Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }
}
