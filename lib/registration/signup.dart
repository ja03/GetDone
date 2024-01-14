import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
export 'signup.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print("Error creating user: ${e.message}");
      rethrow;
    }
  }
}

class _SignupState extends State<Signup> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _industryController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  final Auth _auth = Auth();
  final DatabaseReference userDbRef = FirebaseDatabase.instance.reference().child("Users");

  Future<void> handleSignup() async {
    try {
      await _auth.createWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      Map<dynamic, dynamic> user = {
        "email": _emailController.text,
        "password": _passwordController.text,
        "name": _nameController.text,
        "industry": _industryController.text,
        "reason": _reasonController.text,
      };
      // UserDetailse user= UserDetailse(
      //   email: _emailController.text, 
      //   password: _passwordController.text, 
      //   name: _nameController.text, 
      //   industry: _industryController.text, 
      //   reason: _reasonController.text,
      //   );
      final userId = _auth._auth.currentUser!.uid;
      userDbRef.child(userId).set(user);

      print("User added success to database");
      Navigator.pushNamed(context, '/home');
      
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Exception: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey1,
            child: Center(
              child: Container(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Image.asset("asset/images/Logo.png"),
                    Text(
                      "Your productivity journey begins now!",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
          
                    Form(
                      key: _formKey2,
                      child: Container(
                        width: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                hintText: "Enter your email",
                                filled: false,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter your email.";
                                } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
                                  return "Enter a valid email address.";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
          
                            TextFormField(
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
                                hintText: "Create password",
                                filled: false,
                              ),
                              validator: (value) {
                                if (value!.length < 8) {
                                  return "Password length should be at least 8 characters.";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
          
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                hintText: "Confirm password",
                                filled: false,
                              ),
                              validator: (value) {
                                if (value != _passwordController.text) {
                                  return "Passwords do not match.";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
          
                            TextFormField(
                              controller: _nameController,
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
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
          
                            TextFormField(
                              controller: _industryController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                hintText: "What industry are you in?",
                                filled: false,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Your Industry.";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
          
                            TextFormField(
                              controller: _reasonController,
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
                                  return "Just tell me why.";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
          
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey1.currentState!.validate() &&
                                    _formKey2.currentState!.validate()) {
                                  handleSignup();
                                }
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(200, 108, 123, 149),
                                ),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 180.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
