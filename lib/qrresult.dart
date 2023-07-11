import 'package:flutter/material.dart';
import 'package:scanner_app/appbar.dart';
import 'package:scanner_app/scanner.dart';

class qrResult extends StatelessWidget {
  final String? qrData;
  const qrResult({super.key, required this.qrData});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: NewAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(qrData!),
            ],
          ),
        ),
      ),
    );
  }
}
