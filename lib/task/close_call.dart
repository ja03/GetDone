import 'package:flutter/material.dart';
export 'close_call.dart';

class CloseCall extends StatelessWidget {
  CloseCall({super.key});

  // Sample data for ListView.builder
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
        title: "Close Call",
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(
                    context); // This will pop the current route off the navigator stack
              },
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title:
                Text("Close-cell tasks", style: TextStyle(color: Colors.black)),
          ),
          body: Center(
            child: Container(
              width: 500,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
              
                        //the header title
                        children: [
                          Row(
                            children: [
                              Text(
                                "it's time to make your tasks Soar",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
              
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
          ),
        ));
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
                color: Colors.green,
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
