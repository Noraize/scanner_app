import 'package:flutter/material.dart';
import 'package:scanner_app/test.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

class login_page extends StatefulWidget {
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              textScaleFactor: 1.5,
            ),
            TextField(
              controller: emailController,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                void loginUser(String email, String password) async {
                  try {
                    await _auth.signInWithEmailAndPassword(
                      email: emailController.text.toString().trim(),
                      password: passwordController.text.toString().trim(),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => test(),
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    print("Error");
                  }
                }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
