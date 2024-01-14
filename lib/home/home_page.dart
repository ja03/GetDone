import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getdone/shared/widgets/task_item.dart';
import 'package:getdone/shared/widgets/workspace_item.dart';
import 'package:getdone/shared/widgets/user_detailse.dart';
import 'package:animated_emoji/animated_emoji.dart';
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

  late Future<Map<dynamic, dynamic>?> userData;

  @override
  void initState() {
    super.initState();
    userData = fetchUserData();
  }

  Future<Map<dynamic, dynamic>?> fetchUserData() async {
    FirebaseService fbs = FirebaseService();
    return await fbs.getUserData();
  }

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
                          FutureBuilder<Map<dynamic, dynamic>?>(
                            future: userData,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                // Display a loading indicator while fetching data
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                // Handle error if fetching data fails
                                return Text('Error fetching user data');
                              } else {
                                // Display the user's name if data is successfully fetched
                                String userName =
                                    snapshot.data?['name'] ?? 'Unknown User';
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Hello $userName ",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                        AnimatedEmoji(
                                          AnimatedEmojis.wave.medium,
                                          size: 30,
                                          repeat: false,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Thrilled to Have you Here!",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                );
                              }
                            },
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
                          "Tasks",
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
                          Container(
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

                                List<Map<String, dynamic>> data =
                                    snapshot.data ?? [];
                                return Row(
                                  children: data.map((d) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            '/workspaces/workspace-details');
                                      },
                                      child: WorkspaceItem(
                                        workspaceName: d["name"],
                                        tasksNum: (d["reason"]),
                                        setWidth: 140,
                                        nameFontSize: 16,
                                        numFontSize: 14,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
