import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
export 'login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  bool isEmailValid = true;
  bool isPasswordValid = true;

  Future<void> validateEmail() async {
    try {
      UserCredential? userCredential = await Auth().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text, // Provide a dummy password for validation
      );

      // If the email is not registered, mark it as invalid
      isEmailValid = userCredential != null;
    } catch (e) {
      // Handle Firebase sign-in errors, e.g., user not found
      print("Firebase Email Validation Error: $e");
      isEmailValid = false;
    }
  }

  Future<void> validatePassword() async {
    try {
      UserCredential? userCredential = await Auth().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text, // Provide a dummy password for validation
      );

      // If the email is not registered, mark it as invalid
      isPasswordValid = userCredential != null;
    } catch (e) {
      // Handle Firebase sign-in errors, e.g., user not found
      print("Firebase Password Validation Error: $e");
      isPasswordValid = false;
    }
  }

  Future<void> handleLogin() async {
    await validateEmail();
    await validatePassword();
    try {
      UserCredential? userCredential = await Auth().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential != null) {
        // Successfully signed in, navigate to the desired screen.
        print("Welcome, ${userCredential.user?.email}");
        Navigator.pushNamed(context, '/home');
      } else {
        // Handle unsuccessful sign-in.
        print("Invalid credentials");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Image.asset("asset/images/Logo.png"),
                      Text(
                        "Enter the Land of Productivity",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),

                  //Email
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 35.0, right: 35.0),
                    child: TextFormField(
                      // onChanged: (val){
                      //   setState(() =>  _emailController.value);
                      // },
                      controller: _emailController,
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
                        if (value!.isEmpty || !value.contains("@")) {
                          return "pleas enter your E-mail";
                        }
                        return isEmailValid ? null : "Undefined email";
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //password
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 35.0, right: 35.0, bottom: 10),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        hintText: "Password",
                        filled: false,
                      ),
                      validator: (value) {
                        if (value!.length < 8) {
                          return "pleas enter your Password";
                        }
                        return isPasswordValid ? null : "Invalid password";
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //sing in
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        handleLogin();
                      }
                    },
                    child: Text(
                      "Log in",
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
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),

                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 190.0),
                        // Adjust size by changing the values
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //Create an account
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Don't have an account?"),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/registration/signup');
                            },
                            child: Text(
                              "Create one",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black),
                            ),
                          ),
                        ),
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
