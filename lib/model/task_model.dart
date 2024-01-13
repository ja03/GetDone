// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String? docId;
  final String titleTask;
  final String description;
  final String dateTask;
  final String taskstate;
  TaskModel({
    this.docId,
    required this.taskstate,
    required this.description,
    required this.dateTask,
    required this.titleTask,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docId': docId,
      'titleTask': titleTask,
      'description': description,
      'dateTask': dateTask,
      'taskstate': taskstate,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      docId: map['docId'] != null ? map['docId'] as String : null,
      titleTask: map['titleTask'] as String,
      description: map['description'] as String,
      dateTask: map['dateTask'] as String,
      taskstate: map['taskstate'] as String,
    );
  }

  factory TaskModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return TaskModel(
      docId:doc.id,
        taskstate: doc["Pending"],
        description: doc["description"],
        dateTask: doc["dateTask"],
        titleTask: doc["taskTitile"]);
  }
}
