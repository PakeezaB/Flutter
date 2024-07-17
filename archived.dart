import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'task_model.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({super.key});

  void _restoreTask(Box<Task> archivedTasksBox, int index) {
    final task = archivedTasksBox.getAt(index);
    if (task != null) {
      archivedTasksBox.deleteAt(index);
      Hive.box<Task>('tasksBox').add(task);
    }
  }

  @override
  Widget build(BuildContext context) {
    final archivedTasksBox = Hive.box<Task>('archivedTasksBox');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Archived Tasks'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ValueListenableBuilder(
        valueListenable: archivedTasksBox.listenable(),
        builder: (context, Box<Task> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text('No archived tasks'),
            );
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final task = box.getAt(index);
              if (task == null) return const SizedBox();
              return ListTile(
                title: Text(task.title),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.restore),
                      onPressed: () {
                        _restoreTask(archivedTasksBox, index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Task restored'),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        archivedTasksBox.deleteAt(index);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
