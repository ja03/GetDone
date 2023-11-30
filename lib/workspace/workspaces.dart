import 'package:flutter/material.dart';
export 'workspaces.dart';

class Workspaces extends StatelessWidget {
  const Workspaces({super.key});

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
                  SizedBox(
                      width: 300,
                      height: 30,
                      child: Text(
                        "In the Lab of Productivity",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/workspaces/create');
                        },
                        child: Container(
                          height: 180,
                          width: 180,
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
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/workspaces/workspace-details');
                        },
                        child: Container(
                          height: 180,
                          width: 180,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                            ),
                            child: Center(
                                child: Text(
                              "10 Tasks\n\nOperating System\nCollege Workspace",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )),
                            color: Color.fromARGB(199, 211, 217, 226),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 180,
                          width: 180,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                            ),
                            child: Center(
                                child: Text(
                              "10 Tasks\n\nOperating System\nCollege Workspace",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )),
                            color: Color.fromARGB(199, 211, 217, 226),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 180,
                          width: 180,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                            ),
                            child: Center(
                                child: Text(
                              "10 Tasks\n\nOperating System\nCollege Workspace",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )),
                            color: Color.fromARGB(199, 211, 217, 226),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 180,
                          width: 180,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                            ),
                            child: Center(
                                child: Text(
                              "10 Tasks\n\nOperating System\nCollege Workspace",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )),
                            color: Color.fromARGB(199, 211, 217, 226),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 180,
                          width: 180,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                            ),
                            child: Center(
                                child: Text(
                              "10 Tasks\n\nOperating System\nCollege Workspace",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )),
                            color: Color.fromARGB(199, 211, 217, 226),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
