import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart'; //provides a lightweight and fast key-value database
import 'package:todo_task_final/task_model.dart';
import 'package:todo_task_final/todo_list.dart';

void main() async //to allow asynchronous operations
{
  WidgetsFlutterBinding
      .ensureInitialized(); //Flutter framework is properly initialized or not
  await Hive.initFlutter(); //initializes the Hive database
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>(
      'tasks'); //opens a Hive box named 'tasks' that will store Task objects
  await Hive.openBox<Task>('recentlyDeletedTasks');
  await Hive.openBox<Task>('archivedTasks');
  GoogleFonts.config.allowRuntimeFetching =
      true; //allow fetching fonts at runtime
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListApp(),
    );
  }
}
