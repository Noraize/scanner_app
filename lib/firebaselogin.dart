import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scanner_app/homepage.dart';

Future<void> login(
    String Email, String Password, BuildContext contextfromPage) async {
  try {
    final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: Email,
      password: Password,
    );
    Navigator.push(
      contextfromPage,
      MaterialPageRoute(
        builder: (context) => homepage(),
      ),
    );
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

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
