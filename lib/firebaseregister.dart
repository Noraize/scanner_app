import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scanner_app/login.dart';

Future<void> signup(String email, String password, String name,
    BuildContext contextfromPage) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      await user.updateDisplayName(name);
    }
    Navigator.pop(
      contextfromPage,
      MaterialPageRoute(
        builder: (contextfromPage) => loginscreen(),
      ),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
