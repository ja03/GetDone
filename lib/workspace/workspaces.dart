import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getdone/shared/widgets/workspace_item.dart';
export 'workspaces.dart';

class Workspaces extends StatefulWidget {
  const Workspaces({super.key});

  @override
  State<Workspaces> createState() => _WorkspacesState();
}

Stream<List<Map<String, dynamic>>> streamDataFromFirestore(
    String collectionName) {
  return FirebaseFirestore.instance.collection(collectionName).snapshots().map(
        (QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList(),
      );
}

class _WorkspacesState extends State<Workspaces> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Workspaces",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                    child: Text(
                      "In the Lab of Productivity",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/workspaces/create');
                        },
                        child: Container(
                          height: 86,
                          width: 484,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Center(
                              child: Text(
                                "Create new Workspace",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            color: Color.fromARGB(200, 108, 123, 149),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                    child: StreamBuilder<List<Map<String, dynamic>>>(
                      stream: streamDataFromFirestore('workspaces'),
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
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context, '/workspaces/workspace-details');
                              },
                              child: WorkspaceItem(
                                workspaceName: d["name"],
                                tasksNum: (d["reason"]),
                                setWidth: 484,
                                nameFontSize: 20,
                                numFontSize: 18,
                              ),
                            );
                          }).toList(),
                        );
                      },
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
