import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_task_app/restore_task.dart';

class RecentlyDeletedScreen extends StatefulWidget {
  final List<Map<String, dynamic>> recentlyDeletedTasks;
  final Function(int) restoreTask;

  const RecentlyDeletedScreen({
    Key? key,
    required this.recentlyDeletedTasks,
    required this.restoreTask,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RecentlyDeletedScreenState createState() => _RecentlyDeletedScreenState();
}

class _RecentlyDeletedScreenState extends State<RecentlyDeletedScreen> {
  void _restoreTaskAndRemove(int index) {
    widget.restoreTask(index);
    setState(() {
      widget.recentlyDeletedTasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Recently Deleted',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu), // Menu icon
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen
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
      body: ListView.builder(
        itemCount: widget.recentlyDeletedTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: IconButton(
              icon: const Icon(Icons.restore),
              onPressed: () {
                // Navigate to restore task screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestoreTaskScreen(
                      taskToRestore: widget.recentlyDeletedTasks[index],
                      onRestore: () {
                        _restoreTaskAndRemove(index);
                        Navigator.pop(
                            context); // Pop back to recently deleted screen
                      },
                    ),
                  ),
                );
              },
            ),
            title: Text(widget.recentlyDeletedTasks[index]['title'] ?? ''),
            subtitle: Text(widget.recentlyDeletedTasks[index]['details'] ?? ''),
          );
        },
      ),
    );
  }
}
