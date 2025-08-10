import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_tracker/models/task_model.dart';
import 'package:task_tracker/screens/task_screen.dart';
import 'package:task_tracker/theme/app_theme.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter());

  await Hive.openBox<TaskModel>('tasksBox');

  runApp(const TaskApp());
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