import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class checkin {
  final uuid;
  checkin(this.uuid);
  Future<int> checkinF() async {
    final prefs = await SharedPreferences.getInstance();
    final storedToken = prefs.getString('auth_token');
    final apiUrl = 'https://festifyer.com/api/checkin';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': '$storedToken',
      },
      body: {
        'uuid': uuid,
      },
    );
    if (response.statusCode == 200) {
      debugPrint("<guest_email> check-in success");
      return 200;
    } else if (response.statusCode == 400) {
      debugPrint("Invalid Input");
      return 400;
    } else if (response.statusCode == 401) {
      debugPrint("Unauthorized");
      return 401;
    } else if (response.statusCode == 404) {
      debugPrint("Qr Code does not exist");
      return 404;
    }
    return 0;
  }
}
