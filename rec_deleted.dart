import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_task_final/task_model.dart';

class RecentlyDeletedScreen extends StatelessWidget {
  const RecentlyDeletedScreen(
      {super.key,
      required List<Task> recentlyDeletedTasks,
      required void Function(int index) restoreTask});

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
    }
  }

  @override
  Widget build(BuildContext context) {
    final recentlyDeletedTasksBox = Hive.box<Task>('recentlyDeletedTasks');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recently Deleted'),
      ),
      body: ValueListenableBuilder(
        valueListenable: recentlyDeletedTasksBox.listenable(),
        builder: (context, Box<Task> box, _) {
          if (box.isEmpty) {
            return const Center(child: Text('No recently deleted tasks.'));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final task = box.getAt(index);
              return ListTile(
                title: Text(task?.title ?? 'No title'),
                subtitle: Text(task?.details ?? 'No details'),
                trailing: IconButton(
                  icon: const Icon(Icons.restore),
                  onPressed: () {
                    _restoreTask(context, index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
