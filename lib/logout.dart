import 'package:flutter/material.dart';
import 'package:scanner_app/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout {
  logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print("Logout called");
    Navigator.of(context).pushReplacementNamed('/loginscreen');
  }
}
