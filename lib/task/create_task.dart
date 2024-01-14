import 'package:flutter/material.dart';
export 'create_task.dart';
import 'package:provider/provider.dart';

class Task {
  String taskName;
  // String taskDescription;
  // String taskWorkspace;
  String taskDeadline;
  String taskColor;

  Task({
    required this.taskName,
    // required this.taskDescription,
    // required this.taskWorkspace,
    required this.taskDeadline,
    required this.taskColor,
  });

  Task.withDefaults()
      : taskName = "",
        //    taskDescription = "",
        //    taskWorkspace = "",
        taskColor =
            "red", // Set default color, you can change this based on user selection
        taskDeadline = "";
}

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController dateController = TextEditingController();
  TextEditingController myController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Task newTask = Task.withDefaults();
  String selectedColor = "red";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;

        dateController.text = '${picked.month}/${picked.day}/${picked.year}';
        newTask.taskDeadline = dateController.text;
      });
    }
  }

  void _addTaskToCloseCall(Task newTask, List<Map<String, String>> data) {
    setState(() {
      data.add({
        "taskName": newTask.taskName,
        // "taskWorkspace": "Default Workspace", // Replace with your default workspace
        "taskColor": newTask.taskColor,
        "taskDeadline": newTask.taskDeadline,
      });
    });
  }

  @override
  void initState() {
    super.initState();

    dateController.text =
        '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}';
  }

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
          title: Text(
            "Create a Task",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              width: 500,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Task Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Task name can't be empty.";
                        }
                        newTask.taskName = value;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Add a description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       hintText: "Upload files",
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       suffixIcon: IconButton(
                  //         icon: Icon(Icons.upload),
                  //         onPressed: () {},
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Select workspace",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.keyboard_arrow_down),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                        child: Text(
                          'Set a deadline',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(120, 0, 40, 0),
                          child: TextFormField(
                            controller: dateController,
                            decoration: InputDecoration(
                              // hintText: '08/12/2024',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_month),
                                onPressed: () =>
                                    _selectDate(context), // Pass the context
                              ),
                              contentPadding: EdgeInsets.all(16.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.fromLTRB(40, 10, 62, 0),
                  //       child: Text(
                  //         'Task State',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Padding(
                  //         padding: EdgeInsets.fromLTRB(120, 0, 40, 0),
                  //         child: DropdownButtonFormField<String>(
                  //           decoration: InputDecoration(
                  //             hintText: 'Pending',
                  //             border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(12.0),
                  //               borderSide: BorderSide(color: Colors.black),
                  //             ),
                  //             contentPadding: EdgeInsets.all(16.0),
                  //           ),
                  //           value: 'Pending',
                  //           onChanged: (newValue) {
                  //             print(newValue);
                  //           },
                  //           items: [
                  //             DropdownMenuItem(
                  //               value: 'Completed',
                  //               child: Text('Completed'),
                  //             ),
                  //             DropdownMenuItem(
                  //               value: 'In Progress',
                  //               child: Text('In Progress'),
                  //             ),
                  //             DropdownMenuItem(
                  //               value: 'Pending',
                  //               child: Text('Pending'),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pick a color"),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedColor = "red";
                                });
                              },
                              child: CircularContainer(
                                backgroundColor: Colors.red,
                              ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: CircleBorder()),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedColor = "blue";
                                });
                              },
                              child: CircularContainer(
                                backgroundColor: Colors.blue,
                              ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: CircleBorder()),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedColor = "green";
                                });
                              },
                              child: CircularContainer(
                                backgroundColor: Colors.green,
                              ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: CircleBorder()),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedColor = "grey";
                                });
                              },
                              child: CircularContainer(
                                backgroundColor: Colors.grey,
                              ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: CircleBorder()),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        newTask.taskName = myController.text;
                        newTask.taskDeadline = dateController.text;
                        newTask.taskColor = selectedColor;
                        _addTaskToCloseCall(newTask,
                            Provider.of<List<Map<String, String>>>(context));

                        Navigator.pushNamed(context, '/tasks/close-call');
                      }
                    },
                    child: Text(
                      "Create Taskes",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 16,
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
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 160.0),
                        // Adjust size by changing the values
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CircularContainer extends StatelessWidget {
  final Color backgroundColor;

  CircularContainer({required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.0,
      width: 16.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 3.0,
        ),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // changes the shadow direction
          ),
        ],
      ),
    );
  }
}
