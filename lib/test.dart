import 'package:flutter/material.dart';
import 'package:scanner_app/firebaselogin.dart';
import 'package:scanner_app/hello.dart';

final emailController = TextEditingController(),
    passwordController = TextEditingController();

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'QR Code Scanner - FastDev',
          ),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
        ),
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
