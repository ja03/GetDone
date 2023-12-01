import 'package:flutter/material.dart';
export 'create_workspace.dart';

class CreateWorkspace extends StatefulWidget {
  const CreateWorkspace({super.key});

  @override
  State<CreateWorkspace> createState() => _CreateWorkspaceState();
}

class _CreateWorkspaceState extends State<CreateWorkspace> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController myController = TextEditingController();

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
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "A New Journey Awaits",
                textScaleFactor: 2,
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 35.0, right: 35.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Why are you creating ths workpace?",
                    hintText: "Work/ College Course/...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Can't be empty!.";
                    }
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 35.0, right: 35.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "What do you whant to call it?",
                    hintText: "The Best Workspace In The World!",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Can't be empty!.";
                    }
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 35.0, right: 35.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/workspaces');
                    },
                    child: Text(
                      "Create Workspace",
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 140.0),
                        // Adjust size by changing the values
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
