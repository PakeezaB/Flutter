import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_task_app/add_task_screen.dart';
import 'package:todo_task_app/archive.dart';
import 'package:todo_task_app/rec_deleted.dart';
import 'account.dart';

void main() {
  runApp(const MaterialApp(
    home: TodoListApp(),
  ));
}

class TodoListApp extends StatefulWidget {
  const TodoListApp({super.key});

  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  final List<Map<String, dynamic>> tasks = [];
  final List<Map<String, dynamic>> recentlyDeletedTasks = [];
  final List<Map<String, dynamic>> archivedTasks = [];

  void _editTask(int index) //will specify the task we want to edit
  {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskScreen(
          title: tasks[index][
              'title'], //giving the title of that speciifed index from tasks list
          details: tasks[index]['details'],
          onSubmit: (title, details) {
            setState(() //to update ui
                {
              tasks[index] = {
                'title': title,
                'details': details,
                'isCompleted': tasks[index]['isCompleted']
              };
            });
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void _toggleTaskCompletion(
      int index) //toggles the completion status of a task
  {
    setState(() {
      tasks[index]['isCompleted'] = !tasks[index]['isCompleted'];
    });
  }

  void _deleteTask(
      int index) //deletes a task and moves it to a recently deleted tasks list
  {
    setState(() {
      recentlyDeletedTasks.add(tasks[index]);
      tasks.removeAt(index);
    });
  }

  void _archiveTask(
      int index) //archives a task by moving it from the main list to an archived tasks list.
  {
    setState(() {
      archivedTasks.add(tasks[index]);
      tasks.removeAt(index);
    });
  }

  void _restoreTask(
      int index) //restores a task from the recently deleted tasks list to the main list
  {
    setState(() {
      tasks.add(recentlyDeletedTasks[index]);
      recentlyDeletedTasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'To do List',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu), // Menu icon
            color: Colors.white,
            onPressed: () {
              // Opening popup menu
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(0, kToolbarHeight, 0, 0),
                // Adjusting vertical position
                items: [
                  PopupMenuItem(
                    value: 'Recently deleted',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecentlyDeletedScreen(
                            recentlyDeletedTasks: recentlyDeletedTasks,
                            restoreTask: _restoreTask,
                          ),
                        ),
                      );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0), // Add padding
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
                            archivedTasks: archivedTasks,
                          ),
                        ),
                      );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0), // Add padding
                      child: Text('Archive'),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'My Account',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyAccountScreen()));
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0), // Add padding
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
              child: const Icon(CupertinoIcons.bell), // Cupertino icon
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(
                kToolbarHeight + 6), // Adjust height as needed
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0), // Adjust padding as needed
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                          color: Colors
                              .white), // Placeholder text for search field
                      prefixIcon: const Icon(
                        Icons.search,
                        color:
                            Colors.white, // Set the search icon color to white
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: Colors.white), // Focused border color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(tasks[index]['title']),
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
                  value: tasks[index]['isCompleted'],
                  onChanged: (value) {
                    _toggleTaskCompletion(index);
                  },
                ),
                title: Text(
                  tasks[index]['title'] ?? '',
                  style: TextStyle(
                    decoration: tasks[index]['isCompleted']
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                subtitle: Text(tasks[index]['details'] ?? ''),
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTaskScreen(
                  onSubmit: (title, details) {
                    setState(() {
                      tasks.add({
                        'title': title,
                        'details': details,
                        'isCompleted': false
                      });
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
