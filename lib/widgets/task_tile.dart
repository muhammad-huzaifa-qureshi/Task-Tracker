import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_tracker/models/task_model.dart';

class TaskTile extends StatelessWidget{
  final TaskModel _task;
  final VoidCallback _onDelete;

  const TaskTile({super.key, required TaskModel task, required VoidCallback onDelete}) :
  _task =task,
  _onDelete = onDelete;


  String _formatDate(DateTime dateTime){
    final formattedDate = DateFormat('MMM d, hh:mm a').format(dateTime);
    return formattedDate;
  }


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_task.title),
      subtitle: Text(_formatDate(_task.createdAt)),
      trailing: IconButton(
          onPressed: _onDelete,
          icon: Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.error,)),
      contentPadding: EdgeInsets.zero,
    );
  }
}