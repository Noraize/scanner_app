import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scanner_app/splashscreen.dart';
import 'firebase_options.dart';

void main() {
  var devices = ["A4D6C48997DFDCE4691FD0C020418DA7"];
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  RequestConfiguration requestConfiguration =
      RequestConfiguration(testDeviceIds: devices);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
