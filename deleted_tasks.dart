import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'task_model.dart';

class DeletedTasksScreen extends StatelessWidget {
  const DeletedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deletedTasksBox = Hive.box<Task>('deletedTasksBox');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Deleted Tasks'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ValueListenableBuilder(
        valueListenable: deletedTasksBox.listenable(),
        builder: (context, Box<Task> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text('No deleted tasks'),
            );
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final task = box.getAt(index);
              if (task == null) return const SizedBox();
              return ListTile(
                title: Text(task.title),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    deletedTasksBox.deleteAt(index);
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
