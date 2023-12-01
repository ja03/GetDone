import 'package:flutter/material.dart';
import 'package:getdone/shared/widgets/task_item.dart';
import 'package:getdone/shared/widgets/workspace_item.dart';
export 'home_page.dart';

void handleLClick(c, p) {
  Navigator.pushNamed(c, p);
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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

  final List<Map<String, String>> workspaceData = [
    {"workspaceTasks": "10", "workspaceTitle": "Operating System"},
    {"workspaceTasks": "8", "workspaceTitle": "Frontend Course"},
    {"workspaceTasks": "5", "workspaceTitle": "House Maintenance"},
    {"workspaceTasks": "12", "workspaceTitle": "Physics"},
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 500,
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
                            "Hello Ahmad",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Thrilled to Have you Here!",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 220,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.account_circle_outlined),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/profile');
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/tasks/create');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Close-Call Tasks",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 255,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/tasks/close-call');
                            },
                            child: Text("See More"),
                          ),
                        )
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
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Workspaces",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 280,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/workspaces');
                            },
                            child: Text("See More"),
                          ),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/workspaces/create');
                              },
                              child: Container(
                                height: 150,
                                width: 120,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        15.0), // Adjust the radius as needed
                                  ),
                                  child: Center(
                                      child: Text(
                                    "Create new\nWorkspace",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )),
                                  color: Color.fromARGB(200, 108, 123, 149),
                                ),
                              )),
                          Row(
                            children: workspaceData.map((d) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        '/workspaces/workspace-details');
                                  },
                                  child: WorkspaceItem(
                                    tasksNum: d["workspaceTasks"]!,
                                    workspaceName: d["workspaceTitle"]!,
                                  ));
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Future Focus",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 280,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/tasks/future-focus');
                            },
                            child: Text("See More"),
                          ),
                        )
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
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(
                              200, 108, 123, 149)), // Change button color
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Change corner radius
                        ),
                      ),

                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 150.0),
                        // Adjust size by changing the values
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
