import 'package:flutter/material.dart';
export 'ParentChild_widget.dart';

class MyParentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyChildWidget(),
          ],
        ),
      ),
    );
  }
}

class MyChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Task state"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Pending",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                width: 170,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Deadline"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "08\12\2024",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
