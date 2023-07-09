import 'package:flutter/material.dart';
import 'package:scanner_app/appbar.dart';
import 'package:scanner_app/firebaselogin.dart';
import 'package:scanner_app/hello.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: myAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login"),
              TextField(
                controller: emailController,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  login(
                    emailController.text.toString().trim(),
                    passwordController.text.toString().trim(),
                    context,
                  );
                },
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
