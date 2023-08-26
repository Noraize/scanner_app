import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scanner_app/homepage.dart';
import 'package:scanner_app/login.dart';
import 'package:scanner_app/splashscreen.dart';

void main() {
  var devices = ["A4D6C48997DFDCE4691FD0C020418DA7"];
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  RequestConfiguration requestConfiguration =
      RequestConfiguration(testDeviceIds: devices);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => loginscreen(),
        );
      },
      initialRoute: '/',
      routes: {
        "/loginscreen": (context) {
          return loginscreen();
        }
      },
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
