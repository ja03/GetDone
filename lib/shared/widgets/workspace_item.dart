export 'workspace_item.dart';
import 'package:flutter/material.dart';

class WorkspaceItem extends StatelessWidget {
  final String tasksNum;
  final String workspaceName;

  WorkspaceItem({
    required this.tasksNum,
    required this.workspaceName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15.0), // Adjust the radius as needed
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 140,
                child: Text(
                  tasksNum,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                width: 140,
                child: Text(
                  workspaceName,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )),
        color: Color.fromARGB(199, 211, 217, 226),
      ),
    );
  }
}
