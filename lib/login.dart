import 'package:flutter/material.dart';
import 'package:scanner_app/appbar.dart';
import 'package:scanner_app/firebaselogin.dart';
import 'package:scanner_app/register.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: NewAppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      color: const Color(0xfffd7e14),
                      height: MediaQuery.of(context).size.width / 2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Color(0xfffd7e14),
                    fontFamily: 'LEMONMILK-Regular',
                    fontSize: 40,
                    shadows: <Shadow>[
                      Shadow(
                        color: Color.fromARGB(255, 186, 185, 184),
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: "Email Address",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xfffd7e14),
                        width: 0.5,
                      )),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xfffd7e14),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
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
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xfffd7e14),
                          width: 0.5,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xfffd7e14),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        ),
                      ),
                    ),
                    controller: passwordController,
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: const Color(0xfffd7e14),
                    backgroundColor: const Color(0xfffd7e14),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'LEMONMILK-Regular',
                        fontSize: 20),
                    fixedSize: const Size(100, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    login(
                      emailController.text.toString().trim(),
                      passwordController.text.toString().trim(),
                      context,
                    );
                  },
                  child: const Text("Login"),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Registration(),
                      ),
                    );
                  },
                  child: const Text(
                    "New here? Sign up",
                    style: TextStyle(
                      fontFamily: 'LEMONMILK-Regular',
                      color: Color(0xfffd7e14),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
