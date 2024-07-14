import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_task_final/add_task_screen.dart';
import 'package:todo_task_final/archive.dart';
import 'package:todo_task_final/rec_deleted.dart';
import 'package:todo_task_final/task_model.dart';

import 'account.dart';

class TodoListApp extends StatefulWidget {
  const TodoListApp({super.key});

  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  late Box<Task> tasksBox;

  @override
  void initState() {
    super.initState();
    tasksBox = Hive.box<Task>('tasks');
  }

  void _editTask(int index) {
    final task = tasksBox.getAt(index);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskScreen(
          title: task?.title ?? '',
          details: task?.details ?? '',
          onSubmit: (title, details) {
            setState(() {
              tasksBox.putAt(
                  index,
                  Task(
                      title: title,
                      details: details,
                      isCompleted: task!.isCompleted));
            });
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void _toggleTaskCompletion(int index) {
    final task = tasksBox.getAt(index);
    setState(() {
      tasksBox.putAt(
          index,
          Task(
              title: task!.title,
              details: task.details,
              isCompleted: !task.isCompleted));
    });
  }

  void _deleteTask(int index) {
    setState(() {
      final task = tasksBox.getAt(index);
      final recentlyDeletedTasksBox = Hive.box<Task>('recentlyDeletedTasks');
      recentlyDeletedTasksBox.add(task!);
      tasksBox.deleteAt(index);
    });
  }

  void _archiveTask(int index) {
    setState(() {
      final task = tasksBox.getAt(index);
      final archivedTasksBox = Hive.box<Task>('archivedTasks');
      archivedTasksBox.add(task!);
      tasksBox.deleteAt(index);
    });
  }

  void _restoreTask(int index) {
    setState(() {
      final recentlyDeletedTasksBox = Hive.box<Task>('recentlyDeletedTasks');
      final task = recentlyDeletedTasksBox.getAt(index);
      tasksBox.add(task!);
      recentlyDeletedTasksBox.deleteAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'To do List',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            showMenu(
              context: context,
              position: const RelativeRect.fromLTRB(0, kToolbarHeight, 0, 0),
              items: [
                PopupMenuItem(
                  value: 'Recently deleted',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecentlyDeletedScreen(
                          recentlyDeletedTasks:
                              Hive.box<Task>('recentlyDeletedTasks')
                                  .values
                                  .toList(),
                          restoreTask: _restoreTask,
                        ),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Recently deleted'),
                  ),
                ),
                PopupMenuItem(
                  value: 'Archive',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArchiveScreen(
                          archivedTasks:
                              Hive.box<Task>('archivedTasks').values.toList(),
                        ),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Archive'),
                  ),
                ),
                PopupMenuItem(
                  value: 'My Account',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyAccountScreen(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('My Account'),
                  ),
                ),
              ],
              elevation: 0,
              color: Colors.blue.shade100,
            );
          },
        ),
        actions: [
          CupertinoButton(
            onPressed: () {
              // Handle Cupertino icon tap
            },
            child: const Icon(CupertinoIcons.bell),
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
      body: ValueListenableBuilder(
        valueListenable: tasksBox.listenable(),
        builder: (context, Box<Task> box, _) {
          if (box.isEmpty) {
            return const Center(child: Text('No tasks yet.'));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final task = box.getAt(index);
              return Dismissible(
                key: Key(task!.title),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    _archiveTask(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Task archived'),
                      ),
                    );
                  }
                },
                background: Container(color: Colors.green),
                child: ListTile(
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      _toggleTaskCompletion(index);
                    },
                  ),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration:
                          task.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  subtitle: Text(task.details),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _editTask(index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteTask(index);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    _editTask(index);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(
                onSubmit: (title, details) {
                  setState(() {
                    tasksBox.add(Task(title: title, details: details));
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
