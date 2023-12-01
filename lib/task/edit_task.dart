import 'package:flutter/material.dart';
import 'widgets/ParentChild_widget.dart';
export 'edit_task.dart';

class EditTask extends StatelessWidget {
  EditTask({super.key});
  TextEditingController myController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

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
            title: Text("Edit task"),
          ),
          body: Center(
            child: Container(
              width: 500,
              child: Column(
                children: [
                  SizedBox(
                      height: 20), // Add space between AppBar and Container
                  Form(
                    key: _formKey,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                          width: 500,
                          height: 80,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          4, 0, 20, 0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Week one Assignment",
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: Row(
                                        children: [
                                          Text("College Course "),
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Icon(
                                                  Icons.keyboard_arrow_down),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                    child: Row(
                                      //   mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Save information",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  MyParentWidget(),
                  SizedBox(
                    height: 24,
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
                              onPressed: () {},
                              child: CircularContainer(
                                backgroundColor: Colors.red,
                              ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: CircleBorder()),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: CircularContainer(
                                backgroundColor: Colors.blue,
                              ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: CircleBorder()),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: CircularContainer(
                                backgroundColor: Colors.green,
                              ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: CircleBorder()),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: CircularContainer(
                                backgroundColor:
                                    const Color.fromARGB(255, 48, 82, 109),
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
                    height: 24,
                  ),
                  Container(
                    width: 425,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Task Description",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
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
