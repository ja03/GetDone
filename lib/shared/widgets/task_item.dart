export 'task_item.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String taskColor;
  final String taskName;
  final String taskDeadline;
  final String taskWorkspace;

  TaskItem({
    required this.taskColor,
    required this.taskName,
    required this.taskDeadline,
    required this.taskWorkspace,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(100, 20, 20, 20), width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 86.0,
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 14.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: _getColor(),
            ),
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                taskWorkspace,
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                taskName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Text(
                taskDeadline,
                style: TextStyle(
                    fontSize: 16.0,
                    color: const Color.fromARGB(255, 108, 123, 149)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getColor() {
    switch (taskColor) {
      case "red":
        return Colors.red;
      case "blue":
        return Colors.blue;
      case "green":
        return Colors.green;
      case "gray":
        return Colors.grey;
      default:
        return Colors.blue; // Default color
    }
  }
}
