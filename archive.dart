import 'package:flutter/material.dart';
import 'package:todo_task_final/task_model.dart';

class ArchiveScreen extends StatelessWidget {
  final List<Task> archivedTasks;

  const ArchiveScreen({super.key, required this.archivedTasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive'),
      ),
      body: ListView.builder(
        itemCount: archivedTasks.length,
        itemBuilder: (context, index) {
          final task = archivedTasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.details),
          );
        },
      ),
    );
  }
}
