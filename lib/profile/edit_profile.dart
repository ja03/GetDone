import 'package:flutter/material.dart';
export 'edit_profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // This will pop the current route off the navigator stack
            },
          ),
          title: Text(
            "Edite Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Profile Information"),
                        SizedBox(
                          width: 170,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Save Information"),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 35.0, right: 35.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Ahmad Mahmoud ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 35.0, right: 35.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("Email"),
                        hintText: "ahmadmahmoud@gmail.com",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains("@")) {
                          return "Enter your email correctly.";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.0, left: 35.0, right: 35.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value!.length < 8) {
                          return "Password length should be at least 8";
                        }
                        return null;
                      },
                      controller: _passwordController,
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, left: 35.0, right: 35.0, bottom: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      controller: _confirmPasswordController,
                      obscureText: true,
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
