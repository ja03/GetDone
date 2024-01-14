import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
export 'create_task.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createTask(String title, String description,
      String workspaceName, String state) async {
    try {
      CollectionReference _collectionRef =
          FirebaseFirestore.instance.collection("tasks");
      await _collectionRef.add({
        "title": title,
        "description": description,
        "workspaceName": workspaceName,
        "state": state
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> addMapObjectToDocument(
      String workspaceName, Map<String, dynamic> data) async {
    try {
      final CollectionReference<Map<String, dynamic>> _collectionRef =
          FirebaseFirestore.instance.collection('workspaces');
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _collectionRef.where('name', isEqualTo: workspaceName).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Document with the specified name found, update it
        String documentId = querySnapshot.docs.first.id;
        await _collectionRef.doc(documentId).update({
          'workspaceTasks': FieldValue.arrayUnion([data]),
        });
      } else {
        // Document with the specified name not found, create a new document
        await _collectionRef.add({
          'name': workspaceName,
          'reason': '',
          'workspaceTasks':
              data, // Replace 'yourMapField' with the actual field name you want to update
        });
      }
    } catch (e) {
      print('Error adding map object to document: $e');
    }
  }
}

class _CreateTaskState extends State<CreateTask> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController workspcaeController = TextEditingController();
  String stateController = " ";

  handleClick() async {
    Auth auth1 = Auth();
    String title = titleController.text;
    String description = descriptionController.text;
    String workspaceName = workspcaeController.text;
    String state = stateController;
    auth1.createTask(title, description, workspaceName, state);
    auth1.addMapObjectToDocument(workspaceName, {
      'title': title,
      'description': description,
      'state': state,
      'workspaceName': workspaceName,
    });
    Navigator.pushNamed(context, '/workspaces');
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
                      controller: titleController,
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
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: TextFormField(
                      controller: descriptionController,
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: TextFormField(
                      controller: workspcaeController,
                      decoration: InputDecoration(
                        hintText: "Select workspace",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // suffixIcon: IconButton(
                        //   icon: Icon(Icons.keyboard_arrow_down),
                        //   onPressed: () {},
                        // ),
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
                        padding: EdgeInsets.fromLTRB(40, 10, 62, 0),
                        child: Text(
                          'Task State',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(120, 0, 40, 0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: 'Pending',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              contentPadding: EdgeInsets.all(16.0),
                            ),
                            value: 'Pending',
                            onChanged: (newValue) {
                              setState(() {
                                stateController = newValue.toString();
                              });
                              print(newValue);
                            },
                            items: [
                              DropdownMenuItem(
                                value: 'Completed',
                                child: Text('Completed'),
                              ),
                              DropdownMenuItem(
                                value: 'In Progress',
                                child: Text('In Progress'),
                              ),
                              DropdownMenuItem(
                                value: 'Pending',
                                child: Text('Pending'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        handleClick();
                        // Navigator.pushNamed(context, '/tasks/close-call');
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
