export 'workspace_item.dart';
import 'package:flutter/material.dart';

class WorkspaceItem extends StatelessWidget {
  final String tasksNum;
  final String workspaceName;
  final double setWidth;
  final double numFontSize;
  final double nameFontSize;

  WorkspaceItem({
    required this.tasksNum,
    required this.workspaceName,
    required this.setWidth,
    required this.numFontSize,
    required this.nameFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: setWidth,
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
                width: setWidth,
                child: Text(
                  tasksNum,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: numFontSize),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                width: setWidth,
                child: Text(
                  workspaceName,
                  style: TextStyle(color: Colors.black, fontSize: nameFontSize),
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
