import 'package:flutter/material.dart';
import 'package:getdone/shared/widgets/task_item.dart';
export 'workspace_details.dart';

class WorkspaceDets extends StatefulWidget {
  const WorkspaceDets({super.key});

  @override
  State<WorkspaceDets> createState() => _WorkspaceDetsState();
}

class _WorkspaceDetsState extends State<WorkspaceDets> {
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
          title: Text("Workspace"),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  height: 1000,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Operating System",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "College Course",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 280,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/workspaces/edit-worspace');
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Workspace Progress",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                margin: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(200, 108, 123, 149),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            200, 108, 123, 149)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Completed\n     Tasks",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "16",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 120,
                                margin: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(200, 108, 123, 149),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            200, 108, 123, 149)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "In Progress\n     Tasks",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 120,
                                margin: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(200, 108, 123, 149),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            200, 108, 123, 149)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Pending\n  Tasks",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "6",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Workspace Tasks",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
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
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/tasks/create');
                        },
                        child: Text(
                          "Create new task",
                          style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(
                                  200, 108, 123, 149)), // Change button color
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Change corner radius
                            ),
                          ),

                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 160.0),
                            // Adjust size by changing the values
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
