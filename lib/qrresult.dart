import 'dart:html';
import 'package:flutter/material.dart';
import 'package:scanner_app/appbar.dart';
import 'package:scanner_app/checkin.dart';

class qrResult extends StatelessWidget {
  final String? qrData;
  const qrResult({super.key, required this.qrData});

  @override
  Widget build(BuildContext context) {
    var auth = checkin(uuidextract());

    return MaterialApp(
      home: Scaffold(
        appBar: NewAppBar(),
      ),
    );
  }

  String? uuidextract() {
    const substringToRemove = 'https://festifyer.com/checkin/';
    final resultString = qrData?.replaceAll(substringToRemove, '');
    return resultString;
  }
}
