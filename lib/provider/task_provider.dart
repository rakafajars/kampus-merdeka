import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/database_helper.dart';
import 'package:flutter_application_1/model/local_database/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> _taskModels = [];
  late DatabaseHelper _databaseHelper;

  List<TaskModel> get taskModels => _taskModels;
  TaskProvider() {
    _databaseHelper = DatabaseHelper();
    _getAllTask();
  }

  void _getAllTask() async {
    _taskModels = await _databaseHelper.getTask();
    notifyListeners();
  }

  Future<void> addTask(TaskModel taskModel) async {
    await _databaseHelper.inserTask(taskModel);
    _getAllTask();
  }

  Future<TaskModel> getTaskById(int id) async {
    return await _databaseHelper.getTaskById(id);
  }

  void updateTaskModel(TaskModel taskModel) async {
    await _databaseHelper.updateTask(taskModel);
    _getAllTask();
  }

  void deleteTask(int id) async {
    await _databaseHelper.deleteTask(id);
    _getAllTask();
  }
}
