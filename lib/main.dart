import 'package:flutter/material.dart';
import 'package:task_tracker/screens/task_screen.dart';
import 'package:task_tracker/theme/app_theme.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget{
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Tracker',
      theme: AppTheme.light,

      home: TaskScreen(),
    );
  }
}