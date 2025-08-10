import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_tracker/models/task_model.dart';
import 'package:task_tracker/widgets/task_tile.dart';
import 'package:task_tracker/widgets/toast.dart';

class TaskScreen extends StatefulWidget{
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}



// STATE CLASS
class _TaskScreenState extends State<TaskScreen>{
  // hive box
  final _box = Hive.box<TaskModel>('tasksBox');

  final TextEditingController _controller = TextEditingController();

  void _onDelete(int index){
    _box.deleteAt(index);
    showToast(context, "Task Deleted");
  }

  // build function
  @override
  Widget build(BuildContext context) {
    // return a scaffold
    return Scaffold(
      appBar: AppBar(title: Text("Task Tracker", style: Theme.of(context).textTheme.titleMedium,)),
      body: Padding(
        // padding of 16 on all 4 directions
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            // input field
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                label: Text("Add a new task"),
                hintText: "Go for playing...",
                border: OutlineInputBorder(),
                )
              ),

            const SizedBox(height: 12),

            // Add task Button
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 0),
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
                ),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1
                )
              ),
              onPressed: () {
                final text = _controller.text.trim();
                late final TaskModel task;

                if (text.isNotEmpty) {
                  task = TaskModel(title: text, createdAt: DateTime.now());

                  _box.add(task);
                  _controller.clear();
                  // close keyboard
                  FocusScope.of(context).unfocus();
                  // show toast of success
                  showToast(context, "Task Added");
                }},
              child: Text("Save Task"),
            ),


            // Task list
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _box.listenable(),
                builder: (context, _box, _) {
                  return ListView.builder(
                    itemCount: _box.length,
                    itemBuilder: (context, index) {
                      final task = _box.getAt(index);

                      if (task == null){
                        return SizedBox.shrink();
                      }

                      return TaskTile(
                        task: task,
                        onDelete: (){
                          _onDelete(index);
                        },
                      );
                    }
                  );
                }),
            )
          ],
        ),
      ),
    );
  }
}