import 'package:flutter/material.dart';
export 'workspaces.dart';
import 'package:getdone/shared/widgets/workspace_item.dart';

class Workspaces extends StatefulWidget {
  const Workspaces({super.key});

  @override
  State<Workspaces> createState() => _WorkspacesState();
}

class _WorkspacesState extends State<Workspaces> {
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
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(
                    context); // This will pop the current route off the navigator stack
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
          body: Center(
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
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                            ),
                            child: Center(
                                child: Text(
                              "Create new Workspace",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                            color: Color.fromARGB(200, 108, 123, 149),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                    child: Column(
                      children: workspaceData.map((d) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/workspaces/workspace-details');
                            },
                            child: WorkspaceItem(
                              tasksNum: d["workspaceTasks"]!,
                              workspaceName: d["workspaceTitle"]!,
                              setWidth: 484,
                              nameFontSize: 20,
                              numFontSize: 18,
                            ));
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
