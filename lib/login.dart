import 'package:flutter/material.dart';
import 'package:scanner_app/appbar.dart';
import 'package:scanner_app/firebaselogin.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Stack(children: [
                  Container(
                    color: const Color(0xfffd7e14),
                    height: MediaQuery.of(context).size.width / 1.5,
                  ),
                  Image(
                    width: 500,
                    height: 300,
                    image: AssetImage('assets/img/logo.png'),
                  ),
                ]),
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
                  controller: passwordController,
                  obscureText: true,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Color(0xfffd7e14),
                  backgroundColor: Color(0xfffd7e14),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'LEMONMILK-Regular',
                      fontSize: 20),
                  fixedSize: Size(100, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
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
