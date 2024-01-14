import 'package:flutter/material.dart';
import 'package:getdone/shared/widgets/user_detailse.dart';
export 'edit_profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  late Future<Map<dynamic, dynamic>?> userData;

  @override
  void initState() {
    super.initState();
    userData = fetchUserData();
  }

  Future<Map<dynamic, dynamic>?> fetchUserData() async {
    FirebaseService fbs = FirebaseService();
    return await fbs.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 35.0, right: 35.0),
                  child: FutureBuilder<Map<dynamic, dynamic>?>(
                    future: userData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error fetching user data');
                      } else {
                        return TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            labelText:
                                "Name", // Replace with the actual label you want to use
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          initialValue: snapshot.data?['name'] ?? '',
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 35.0, right: 35.0),
                  child: FutureBuilder<Map<dynamic, dynamic>?>(
                    future: userData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error fetching user data');
                      } else {
                        return TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            labelText:
                                "Email", // Replace with the actual label you want to use
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          initialValue: snapshot.data?['email'] ?? '',
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 35.0, right: 35.0),
                  child: FutureBuilder<Map<dynamic, dynamic>?>(
                    future: userData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error fetching user data');
                      } else {
                        return TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            labelText:
                                "Password", // Replace with the actual label you want to use
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          obscureText: true,
                          initialValue: snapshot.data?['password'] ?? '',
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 35.0, right: 35.0, bottom: 10.0),
                  child: FutureBuilder<Map<dynamic, dynamic>?>(
                    future: userData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error fetching user data');
                      } else {
                        return TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            labelText: "Industry",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          initialValue: snapshot.data?['industry'] ?? '',
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
