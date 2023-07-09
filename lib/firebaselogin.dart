import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scanner_app/hello.dart';

Future<void> login(String Email, String Password, BuildContext context) async {
  try {
    final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: Email,
      password: Password,
    );
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Hello(),
        ));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      debugPrint('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      debugPrint('The account already exists for that email.');
    }
  } catch (e) {}
}
