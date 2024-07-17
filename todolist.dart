import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/archived.dart';
import 'package:todo_list_app/deleted_tasks.dart';
import 'task_model.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  late Box<Task> tasksBox;
  late Box<Task> archivedTasksBox;
  late Box<Task> deletedTasksBox;
  List<Task> _filteredTasks = [];

  @override
  void initState() {
    super.initState();
    tasksBox = Hive.box<Task>('tasksBox');
    archivedTasksBox = Hive.box<Task>('archivedTasksBox');
    deletedTasksBox = Hive.box<Task>('deletedTasksBox');
    _filteredTasks = tasksBox.values.toList();
    _searchController.addListener(_searchTasks);
  }

  void _searchTasks() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTasks = tasksBox.values
          .where((task) => task.title.toLowerCase().contains(query))
          .toList();
    });
  }

  void _addTask(String title) {
    final task = Task(title: title);
    tasksBox.add(task);
    _searchTasks();
  }

  void _deleteTask(int index) {
    final task = tasksBox.getAt(index);
    if (task != null) {
      tasksBox.deleteAt(index);
      deletedTasksBox.add(task);
      _searchTasks();
    }
  }

  void _archiveTask(int index) {
    final task = tasksBox.getAt(index);
    if (task != null) {
      tasksBox.deleteAt(index);
      archivedTasksBox.add(task);
      _searchTasks();
    }
  }

  // ignore: unused_element
  void _restoreTask(int index) {
    final task = archivedTasksBox.getAt(index);
    if (task != null) {
      archivedTasksBox.deleteAt(index);
      tasksBox.add(task);
      _searchTasks();
    }
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: 'Enter task title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _addTask(_controller.text);
                _controller.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('To-Do List', style: TextStyle(color: Colors.white)),
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.menu, color: Colors.white),
          onSelected: (value) {
            switch (value) {
              case 'Archived':
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ArchivedTasksScreen(),
                  ),
                );
                break;
              case 'Deleted':
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DeletedTasksScreen(),
                  ),
                );
                break;
            }
          },
          itemBuilder: (BuildContext context) {
            return {'Archived', 'Deleted'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search tasks',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[600],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: tasksBox.listenable(),
        builder: (context, Box<Task> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text('No tasks yet'),
            );
          }
          return ListView.builder(
            itemCount: _filteredTasks.length,
            itemBuilder: (context, index) {
              final task = _filteredTasks[index];
              return Dismissible(
                key: Key(task.title),
                background: Container(
                  color: Colors.green,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Icon(Icons.archive, color: Colors.white),
                ),
                secondaryBackground: Container(
                  color: Colors.green,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20.0),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    _archiveTask(tasksBox.values.toList().indexOf(task));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Task archived'),
                      ),
                    );
                  } else if (direction == DismissDirection.startToEnd) {
                    _deleteTask(tasksBox.values.toList().indexOf(task));
                  }
                },
                child: ListTile(
                  title: Text(task.title),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          // Edit task functionality
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteTask(tasksBox.values.toList().indexOf(task));
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
