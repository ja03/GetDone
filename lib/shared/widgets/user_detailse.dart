import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
export 'user_detailse.dart';

class UserDetailse {
  String email;
  String password;
  String name;
  String industry;
  String reason;

  UserDetailse({
    required this.email,
    required this.password,
    required this.name,
    required this.industry,
    required this.reason,
  });

  //convert UserDetailse object to a map
  Map<dynamic, dynamic> toMap() {
    return {
      'Name': name,
      'email': email,
      'password': password,
      'industry': industry,
      'reason': reason
    };
  }

  //create UserDetailse object to a map
  factory UserDetailse.fromMap(Map<dynamic, dynamic> map) {
    return UserDetailse(
        email: map['email'],
        password: map['password'],
        name: map['Name'],
        industry: map['industry'],
        reason: map['reason']);
  }
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

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DatabaseEvent userDataEvent =
            await _database.child('Users').child(user.uid).once();

        DataSnapshot userDataSnapshot = userDataEvent.snapshot;

        dynamic userData = userDataSnapshot.value;

        if (userData != null && userData is Map<String, dynamic>) {
          // The keys for the user's data
          dynamic userName = userData['name'];
          dynamic userEmail = userData['email'];
          dynamic userPassword = userData['password'];
          dynamic userIndustry = userData['industry'];

          // Return a map with 'username', 'email', 'industry', and 'password' keys for consistency with your UI
          return {
            'name': userName,
            'email': userEmail,
            'industry': userIndustry,
            'password': userPassword
          };
        } else {
          print('User data not found or invalid format.');
          return null;
        }
      } else {
        print('User not logged in.');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
}
