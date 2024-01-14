import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getdone/model/task_model.dart';

class TaskService {
  final taskColletion = FirebaseFirestore.instance.collection('task');

  //creat
  void addNewTask(TaskModel model) {
    taskColletion.add(model.toMap());
  }
}
