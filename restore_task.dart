import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_task_final/task_model.dart';

class RestoreTaskScreen extends StatelessWidget {
  final int taskIndex;

  const RestoreTaskScreen({
    Key? key,
    required this.taskIndex,
  }) : super(key: key);

  void _restoreTask(BuildContext context, int index) {
    final recentlyDeletedTasksBox = Hive.box<Task>('recentlyDeletedTasks');
    final tasksBox = Hive.box<Task>('tasks');
    final task = recentlyDeletedTasksBox.getAt(index);

    if (task != null) {
      tasksBox.add(task);
      recentlyDeletedTasksBox.deleteAt(index);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Task restored'),
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final recentlyDeletedTasksBox = Hive.box<Task>('recentlyDeletedTasks');
    final task = recentlyDeletedTasksBox.getAt(taskIndex);

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
              task?.title ?? 'No title',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              task?.details ?? 'No details',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _restoreTask(context, taskIndex),
              child: const Text('Restore Task'),
            ),
          ],
        ),
      ),
    );
  }
}
