import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scanner_app/login_page.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(login_page());
}
