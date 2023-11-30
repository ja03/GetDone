import 'package:flutter/material.dart';
export 'signup.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Column(
                    children: [
                      Image.asset("asset/images/Logo.png"),
                      Text(
                        "Your productivity journey begins now!",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
              
                  SizedBox(height: 30),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 35.0, right: 35.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        hintText: "enter a valid email",
                        filled: false,
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains("@")) {
                          return "Enter your email correctly.";
                        }
                      },
                    ),
                  ),
              
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 35.0, right: 35.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        hintText: "create password",
                        filled: false,
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        hintText: "confirm password",
                        filled: false,
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
              
                  ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   var sb =
                      //       SnackBar(content: Text("${_passwordController.text}"));
                      //   ScaffoldMessenger.of(context).showSnackBar(sb);
                      // }
                      Navigator.pushNamed(context, '/registration/userInfo');
                    },
                    child: Text(
                      "Sing Up",
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
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 180.0),
                        // Adjust size by changing the values
                      ),
                    ),
                  ),
              
                  SizedBox(
                    height: 20,
                  ),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 45,
                      ),
                      Text("Or continue with"),
                    ],
                  ),
              
                  SizedBox(
                    height: 20,
                  ),
              
                  //google & apple button
                  ElevatedButton(
                    onPressed: () {
                      // Add your sign-in logic here
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // Change button color
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
              
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 140.0),
                        // Adjust size by changing the values
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'asset/images/google-icon.png',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 4),
                        Text('Sign in with Google'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your sign-in logic here
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // Change button color
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
              
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 140.0),
                        // Adjust size by changing the values
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'asset/images/apple-icon.png',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 4),
                        Text('Sign in with Google'),
                      ],
                    ),
                  ),
              
                  SizedBox(
                    height: 20,
                  ),
              
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Already have an account?"),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/registration/login');
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black),
                            ),
                          ),
                        )
                      ],
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
