import 'package:flutter/material.dart';
import 'package:todo_task_app/todo_list.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Add this line
    home: TodoListApp(),
  ));
}
