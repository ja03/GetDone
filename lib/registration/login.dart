import 'package:flutter/material.dart';
export 'login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
                padding:
                    const EdgeInsets.only(top: 10.0, left: 35.0, right: 35.0),
                child: TextFormField(
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
                    if (value!.isEmpty) {
                      return "pleas enter your Password";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //sing in
              ElevatedButton(
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   var sb = SnackBar(content: Text("${myController.text}"));
                  //   ScaffoldMessenger.of(context).showSnackBar(sb);
                  // }
                  Navigator.pushNamed(context, '/home');
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

              //forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/registration/confirmEmail');
                        },
                        child: Text(
                          "forgot Password?",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
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
                          Navigator.pushNamed(context, '/registration/signup');
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
    );
  }
}
