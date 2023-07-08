import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
      title: const Text(
        'QR Code Scanner - FastDev',
      ),
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.black,
    )));
  }
}
