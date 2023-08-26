import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewAppBar extends AppBar {
  NewAppBar.nav(bool check, BuildContext context, this.actions, {super.key}) {
    nav(check, context);
  }
  NewAppBar(this.actions, {super.key});

  @override
  final Widget title = const Image(
    image: AssetImage('assets/img/festifyer.png'),
    width: 200,
    height: 200,
  );
  @override
  var leading;

  @override
  final Color backgroundColor = const Color.fromARGB(255, 255, 255, 255);

  @override
  final bool centerTitle = true;

  @override
  final double elevation = 0;

  void nav(bool homepage, BuildContext context) {
    if (homepage == true) {
      leading = null;
    } else {
      leading = BackButton(
        onPressed: () => Navigator.pop(context),
        color: const Color(0xfffd7e14),
      );
    }
  }

  @override
  final List<Widget> actions;
}
