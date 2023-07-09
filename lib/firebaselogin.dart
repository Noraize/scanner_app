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
    if (e.code == 'wrong-password') {
      debugPrint('Wrong Password');
    } else if (e.code == 'user-not-found') {
      debugPrint('The account does not exist.');
    } else if (e.code == 'invalid-email') {
      debugPrint('Wrong email');
    }
  } catch (e) {}
}
