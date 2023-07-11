import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

late BannerAd bannerAd;

initBannarAd(bool isAdLoaded) {
  bannerAd = BannerAd(
    size: AdSize.banner,
    adUnitId: "ca-app-pub-3940256099942544/6300978111",
    listener: BannerAdListener(
      onAdLoaded: (ad) {
        isAdLoaded = true;
        debugPrint("No Error");
      },
      onAdFailedToLoad: (ad, error) {
        ad.dispose();
        debugPrint("The Error is $error");
      },
    ),
    request: const AdRequest(),
  );
  bannerAd.load();
}
