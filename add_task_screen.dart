import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'task_model.dart';

class AddTaskScreen extends StatefulWidget {
  final String? title;
  final String? details;
  final int? taskId;

  const AddTaskScreen(
      {super.key,
      this.title,
      this.details,
      this.taskId,
      required Null Function(dynamic title, dynamic details) onSubmit});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _detailsController;
  late Box<Task> taskBox;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _detailsController = TextEditingController(text: widget.details);
    taskBox = Hive.box<Task>('tasks');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  void _saveTask() {
    final String title = _titleController.text;
    final String details = _detailsController.text;

    if (widget.taskId != null) {
      // Update existing task
      final task = taskBox.get(widget.taskId);
      if (task != null) {
        task.title = title;
        task.details = details;
        task.save();
      }
    } else {
      // Add new task
      final newTask = Task(title: title, details: details);
      taskBox.add(newTask);
    }

    Navigator.pop(context); // Close the screen after saving
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _detailsController,
              decoration: const InputDecoration(labelText: 'Details'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveTask,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
