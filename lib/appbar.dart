import 'package:flutter/material.dart';

class NewAppBar extends AppBar {
  @override
  final Widget title = Image(
    image: AssetImage('assets/img/festifyer.png'),
    width: 200,
    height: 200,
  );

  @override
  final Color backgroundColor = Color.fromARGB(255, 255, 255, 255);

  @override
  final bool centerTitle = true;

  @override
  final double elevation = 0.5;
}
