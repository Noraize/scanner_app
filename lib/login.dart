import 'package:flutter/material.dart';
import 'package:scanner_app/appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanner_app/homepage.dart';
import 'package:scanner_app/loginapi.dart';

import 'launchRegisterPage.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: NewAppBar(),
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(189, 255, 135, 36),
                Color.fromARGB(255, 252, 101, 101),
              ],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: GoogleFonts.getFont('Raleway',
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 217, 179),
                        hintText: "Email Address",
                        prefix: Icon(Icons.person),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xfffd7e14),
                          ),
                        ),
                      ),
                      controller: emailController,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextField(
                      obscureText: true,
                      autofocus: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 217, 179),
                        hintText: "Password",
                        prefix: Icon(Icons.lock),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xfffd7e14),
                          ),
                        ),
                      ),
                      controller: passwordController,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color.fromARGB(172, 255, 255, 255),
                      fixedSize: const Size(100, 50),
                      textStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      var auth = authenticateusingapi(
                        emailController.text,
                        passwordController.text,
                      );
                      await auth.authenticateLogin(
                          auth.username, auth.password);
                      if (authenticateusingapi.loginsuccess) {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => homepage(),
                          ),
                        );
                      }
                    },
                    child: const Text("Login"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      launchURLApp();
                    },
                    child: const Text(
                      "New here? Sign up!",
                      style: TextStyle(
                        fontFamily: 'LEMONMILK-Regular',
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
