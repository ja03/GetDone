import 'package:flutter/material.dart';
export 'edit_workspace.dart';

class EditWorkspace extends StatefulWidget {
  const EditWorkspace({super.key});

  @override
  State<EditWorkspace> createState() => _EditWorkspaceState();
}

class _EditWorkspaceState extends State<EditWorkspace> {
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
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 35.0, right: 35.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Workspace Field",
                    hintText: "College Course",
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
                    labelText: "Workspace Name",
                    hintText: "Operatiing System",
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
              ElevatedButton(
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   var sb = SnackBar(content: Text("${myController.text}"));
                  //   ScaffoldMessenger.of(context).showSnackBar(sb);
                  // }
                  Navigator.pushNamed(context, '/workspaces/workspace-details');
                },
                child: Text(
                  "Save changes",
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 18,
                      color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(
                          200, 108, 123, 149)), // Change button color
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15.0), // Change corner radius
                    ),
                  ),

                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 155.0),
                    // Adjust size by changing the values
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
