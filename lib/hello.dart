import 'package:flutter/material.dart';
import 'package:scanner_app/appbar.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: myAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Signed In!"),
            ],
          ),
        ),
      ),
    );
  }
}
