import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/local_database/task_model.dart';
import 'package:flutter_application_1/provider/task_provider.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  final TaskModel? taskModel;
  const TaskScreen({
    super.key,
    this.taskModel,
  });

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController _taskNameController = TextEditingController();

  bool _isUpdate = false;

  @override
  void initState() {
    if (widget.taskModel != null) {
      _taskNameController =
          TextEditingController(text: widget.taskModel?.taskName);
      _isUpdate = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("hasil $_isUpdate");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Screen',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Task Title',
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: _taskNameController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: 'E.g. study',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_isUpdate) {
                  final taskModel = TaskModel(
                    id: widget.taskModel!.id,
                    taskName: _taskNameController.text,
                  );

                  Provider.of<TaskProvider>(context, listen: false)
                      .updateTaskModel(taskModel);
                } else {
                  final task = TaskModel(taskName: _taskNameController.text);
                  Provider.of<TaskProvider>(context, listen: false)
                      .addTask(task);
                }

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      _isUpdate
                          ? "Update Task Berhasil"
                          : 'Insert Task Berhasil',
                    ),
                  ),
                );
              },
              child: Text(
                _isUpdate ? 'Update Task' : 'Insert Task',
              ),
            )
          ],
        ),
      ),
    );
  }
}
