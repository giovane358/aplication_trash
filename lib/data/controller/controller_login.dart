import 'package:firebase_auth/firebase_auth.dart%20';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerLogin extends GetxController {
  final auth = FirebaseAuth.instance;
  var email = TextEditingController();
  var password = TextEditingController();

  void login() async {
    try {
      auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
