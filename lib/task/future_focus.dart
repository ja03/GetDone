import 'package:flutter/material.dart';
export 'future_focus.dart';
import 'package:getdone/shared/widgets/task_item.dart';

class FutureFocus extends StatefulWidget {
  const FutureFocus({super.key});

  @override
  State<FutureFocus> createState() => _FutureFocusState();
}

class _FutureFocusState extends State<FutureFocus> {
  final List<Map<String, String>> data = [
    {
      "taskName": "Clean the house",
      "taskWorkspace": "Home work",
      "taskColor": "red",
      "taskDeadline": "21/07/2023",
    },
    {
      "taskName": "Finish the assignment",
      "taskWorkspace": "College course",
      "taskColor": "blue",
      "taskDeadline": "22/05/2023",
    },
    {
      "taskName": "Study OS",
      "taskWorkspace": "College course",
      "taskColor": "green",
      "taskDeadline": "22/05/2023",
    },
    {
      "taskName": "Make dinner",
      "taskWorkspace": "Home Work",
      "taskColor": "gray",
      "taskDeadline": "22/08/2023",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // This will pop the current route off the navigator stack
            },
          ),
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Future Focus",
            style: TextStyle(fontSize: 15),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 500,
              child: Column(
                children: [
                  SizedBox(
                    height: 32.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Tasks Yet to Take Flight!",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // view task cards here
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: Column(
                      children: data.map((d) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/tasks/task-details');
                            },
                            child: TaskItem(
                              taskColor: d["taskColor"]!,
                              taskName: d["taskName"]!,
                              taskDeadline: d["taskDeadline"]!,
                              taskWorkspace: d["taskWorkspace"]!,
                            ));
                      }).toList(),
                    ),
                  ),
                  // end of tasks here
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
