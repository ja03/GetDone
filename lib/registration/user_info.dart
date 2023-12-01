import 'package:flutter/material.dart';
export 'user_info.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let's Get To Know You More",
                    textScaleFactor: 2,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 35.0, right: 35.0, bottom: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        hintText: "Full Name",
                        filled: false,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Full Name.";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 35.0, right: 35.0, bottom: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        hintText: "What industry your in?",
                        filled: false,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Industry.";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 35.0, right: 35.0, bottom: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        hintText: "Why are you using the app?",
                        filled: false,
                      ),
                      validator: (value) {
                        if (value!.length <= 0) {
                          return "Just tell me why";
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/home');
                      }
                    },
                    child: Text(
                      "Create my account",
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
                          borderRadius: BorderRadius.circular(
                              15.0), // Change corner radius
                        ),
                      ),

                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 150.0),
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
