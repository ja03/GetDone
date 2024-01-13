import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
export 'user_detailse.dart';

class UserDetailse{
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
  Map<dynamic, dynamic> toMap(){
    return{
      'Name':name,
      'email':email,
      'password':password,
      'industry':industry,
      'reason':reason
    };
  }

  //create UserDetailse object to a map
  factory UserDetailse.fromMap(Map<dynamic, dynamic> map){
    return UserDetailse(
      email: map['email'], 
      password: map['password'], 
      name: map['Name'], 
      industry: map['industry'], 
      reason: map['reason']
    );
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

class FirebaseService{
    User? user =Auth()._auth.currentUser;
    final DatabaseReference userRef = FirebaseDatabase.instance.ref().child("Users");
    Future<UserDetailse?> getUserData() async{
      try{
        if(user!=null){
        // var userid = Auth()._auth.currentUser!.uid;
        DatabaseEvent event = await userRef.child(user!.uid).once();
        if(event.snapshot.value!= null){
          Map<dynamic,dynamic> snapMap=event.snapshot.value as dynamic;
          return UserDetailse.fromMap(snapMap);
        }else{
          print("current user is null");
          return null;
        }
        }else{
          print("current user is null or not available");
          return null;
        } 
      }catch(e){
        print(e.toString());
        return null;
      }
    }
}