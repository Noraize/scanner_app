import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scanner_app/appbar.dart';
import 'package:scanner_app/google_adsense.dart';
import 'package:scanner_app/login.dart';
import 'package:scanner_app/scanner.dart';

bool isAdLoaded = false;
String data = "";

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    super.initState();
    setState(
      () {
        isAdLoaded = true;
      },
    );
    initBannarAd(isAdLoaded);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: NewAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: const Color(0xfffd7e14),
                  backgroundColor: const Color(0xfffd7e14),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'LEMONMILK-Regular',
                      fontSize: 20),
                  fixedSize: const Size(200, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  data = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScanQrPage(),
                    ),
                  );
                },
                child: const Text("QR Code Scanner"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: const Color(0xfffd7e14),
                  backgroundColor: const Color(0xfffd7e14),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'LEMONMILK-Regular',
                      fontSize: 20),
                  fixedSize: const Size(200, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  //Code To Sign Out From SQL
                  Navigator.pop(
                    context,
                    const loginscreen(),
                  );
                },
                child: const Text("Logout"),
              ),
            ],
          ),
        ),
        bottomNavigationBar: isAdLoaded
            ? SizedBox(
                height: bannerAd.size.height.toDouble(),
                width: bannerAd.size.width.toDouble(),
                child: AdWidget(ad: bannerAd),
              )
            : const SizedBox(),
      ),
    );
  }
}
