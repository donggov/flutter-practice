import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone/models/user_provider.dart';

class AuthService {

  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static void signUp(BuildContext context, String name, String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      FirebaseUser signedInUser = authResult.user;

      if (signedInUser != null) {
        _firestore.collection("/users").document(signedInUser.uid).setData({
          "name": name,
          "email": email,
          "profileImageUrl": "",
        });

        Provider.of<UserProvider>(context).userId = signedInUser.uid;
        Navigator.pop(context);
      }

    } catch (e) {
      print(e);
    }
  }

  static logout(BuildContext context) {
    print("logout");
    _auth.signOut();
  }

  static login(BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

}