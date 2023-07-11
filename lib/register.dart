import 'package:flutter/material.dart';
import 'package:scanner_app/appbar.dart';
import 'package:scanner_app/firebaseregister.dart';

class Regisration extends StatelessWidget {
  final regNameController = TextEditingController();
  final regEmailController = TextEditingController();
  final regPassController = TextEditingController();

  Regisration({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: NewAppBar.nav(false, context),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: const Color(0xfffd7e14),
                  height: MediaQuery.of(context).size.width / 1.45,
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  "SIGN UP",
                  style: TextStyle(
                      color: Color(0xfffd7e14),
                      fontFamily: 'LEMONMILK-Regular',
                      fontSize: 40,
                      shadows: <Shadow>[
                        Shadow(
                            color: Color.fromARGB(255, 186, 185, 184),
                            blurRadius: 0.5,
                            offset: Offset(4, 4)),
                      ]),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: "Username",
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
                              right: Radius.circular(20))),
                    ),
                    controller: regNameController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: const TextField(
                    autofocus: true,
                    decoration: InputDecoration(
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
                              right: Radius.circular(20))),
                    ),
                    //controller: emailController,
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
                      )),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xfffd7e14),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                              right: Radius.circular(20))),
                    ),
                    controller: regPassController,
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
                    fixedSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    Register().signup(
                        regEmailController.text.trim(),
                        regPassController.text.trim(),
                        regNameController.text.trim());
                  },
                  child: const Text("Sign Up"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
