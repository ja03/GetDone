import 'package:flutter/material.dart';
export 'confirm_email.dart';

class ConfirmEmail extends StatefulWidget {
  const ConfirmEmail({super.key});

  @override
  State<ConfirmEmail> createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create a new password in no time",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "You will receive an email containing a unique\ncode use this code to verify your account.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    hintText: "enter your Email",
                    filled: false,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Email.";
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   var sb = SnackBar(content: Text("${myController.text}"));
                  //   ScaffoldMessenger.of(context).showSnackBar(sb);
                  // }
                  Navigator.pushNamed(context, '/registration/confirmCode');
                },
                child: Text(
                  "Send code",
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 16,
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
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 160.0),
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
