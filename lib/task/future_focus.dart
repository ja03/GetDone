import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:getdone/shared/widgets/task_item.dart';
export 'future_focus.dart';

class FutureFocus extends StatefulWidget {
  const FutureFocus({super.key});

  @override
  State<FutureFocus> createState() => _FutureFocusState();
}

class _FutureFocusState extends State<FutureFocus> {
  Stream<List<Map<String, dynamic>>> streamDataFromFirestore(
      String collectionName) {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .snapshots()
        .map(
          (QuerySnapshot querySnapshot) => querySnapshot.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList(),
        );
  }

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
                    child: StreamBuilder<List<Map<String, dynamic>>>(
                      stream: streamDataFromFirestore('tasks'),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        List<Map<String, dynamic>> data = snapshot.data ?? [];
                        return Column(
                          children: data.map((d) {
                            return GestureDetector(
                              onTap: () {},
                              child: TaskItem(
                                taskColor: d["blue"] ??
                                    'blue', // Replace with your default color
                                taskName: d["title"] ??
                                    'No Title', // Replace with your default title
                                taskDeadline: d["state"] ??
                                    'No State', // Replace with your default state
                                taskWorkspace: d["workspaceName"] ??
                                    'No Workspace', // Replace with your default workspace
                              ),
                            );
                          }).toList(),
                        );
                      },
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
