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

  // Convert UserDetailse object to a map
  Map<String, Object?> toMap() {
    return {
      'Name': name,
      'email': email,
      'password': password,
      'industry': industry,
      'reason': reason,
    };
  }

  // Create UserDetailse object from a map
  factory UserDetailse.fromMap(Map<String, dynamic> map) {
    return UserDetailse(
      email: map['email'],
      password: map['password'],
      name: map['Name'],
      industry: map['industry'],
      reason: map['reason'],
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
          dynamic userName = userData['name'];
          dynamic userEmail = userData['email'];
          dynamic userPassword = userData['password'];
          dynamic userIndustry = userData['industry'];

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

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<void> updateUserData(String userId, UserDetailse userDetailse) async {
    try {
      await _database.child('Users').child(userId).update(userDetailse.toMap());
    } catch (e) {
      print('Error updating user data: $e');
      rethrow; // Rethrow the exception to handle it in the calling function
    }
  }
}
