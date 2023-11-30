import 'package:flutter/material.dart';
export 'workspace_details.dart';

class WorkspaceDets extends StatefulWidget {
  const WorkspaceDets({super.key});

  @override
  State<WorkspaceDets> createState() => _WorkspaceDetsState();
}

class _WorkspaceDetsState extends State<WorkspaceDets> {
  final List<TaskItemData> tasks = [
    TaskItemData(
      title: "Data Base",
      subtitle: "Week one assignment",
      date: "23rd. Oct. 23",
    ),
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
                            width: 180,
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
                                width: 30,
                              ),
                              Text("Workspace Progress"),
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
                                child: Text(
                                  "Completed\n     Tasks",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
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
                                child: Text(
                                  "Completed\n     Tasks",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
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
                                child: Text(
                                  "Completed\n     Tasks",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text("Workspace Tasks"),
                        ],
                      ),
                      SizedBox(
                        height: 300,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 34),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  //the header title
                                  children: [
                                    // ListView.builder for dynamic tasks
                                    ListView.builder(
                                      itemCount: tasks.length * 5,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        final taskIndex = index % tasks.length;
                                        return Column(
                                          children: [
                                            TaskItem(task: tasks[taskIndex]),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
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
                                vertical: 15.0, horizontal: 100.0),
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

class TaskItemData {
  String title;
  String subtitle;
  String date;

  TaskItemData({
    required this.title,
    required this.subtitle,
    required this.date,
  });
}

class TaskItem extends StatelessWidget {
  final TaskItemData task;

  const TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //  button press logic here
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 512,
        height: 86,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 13,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(task.title, style: TextStyle(color: Colors.black)),
                    Text(task.subtitle,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    Row(
                      children: [
                        Text(task.date, style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
