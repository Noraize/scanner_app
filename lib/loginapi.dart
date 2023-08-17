import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class authenticateusingapi {
  final username;
  final password;
  static bool loginsuccess = false;
  authenticateusingapi(this.username, this.password);
  Future<void> authenticateLogin(String username, String password) async {
    final apiUrl = 'https://festifyer.com/api/login';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Successful login
      debugPrint('Login successful');
      final jsonData = json.decode(response.body);
      final token = jsonData['token'] as String;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('auth_token', token);
      debugPrint('Token stored: $token');
      loginsuccess = true;
    } else if (response.statusCode == 400) {
      // Failed login
      debugPrint('Invalid Input');
    } else {
      debugPrint("Unauthorized");
    }
  }
}
