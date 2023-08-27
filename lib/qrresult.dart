import 'package:animated_cross/animated_cross.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanner_app/appbar.dart';
import 'package:scanner_app/checkin.dart';
import 'package:animated_check/animated_check.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:scanner_app/logout.dart';
import 'scanner.dart';

String data = "";

class qrResult extends StatefulWidget {
  final String? qrData;
  const qrResult({super.key, required this.qrData});

  @override
  State<qrResult> createState() => _qrResultState();
}

class _qrResultState extends State<qrResult>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();

    player.play(AssetSource("sounds/tick.mp3"));
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var check = checkin(uuidextract());
    var val = (check2(check));

    return MaterialApp(
      home: Scaffold(
        appBar: NewAppBar([
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                final a = Logout();
                a.logout(context);
              },
              child: const Icon(
                Icons.logout_outlined,
                color: Colors.orange,
              ),
            ),
          )
        ]),
        body: FutureBuilder(
          future: val,
          builder: (context, snapshot) => Column(
            children: [
              LinearPercentIndicator(
                animation: true,
                progressColor: const Color(0xfffd7e14),
                backgroundColor: const Color.fromARGB(90, 253, 125, 20),
                percent: 1,
                animationDuration: 6000,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              snapshot.connectionState == ConnectionState.waiting
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .15,
                        ),
                        const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xfffd7e14),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (snapshot.connectionState !=
                                  ConnectionState.waiting &&
                              snapshot.data!.contains("check-in success") &&
                              snapshot.data != null &&
                              dobaraScanKaro(context)) ...[
                            Column(
                              children: [
                                AnimatedCheck(
                                  progress: _animation,
                                  size: 200,
                                  color: const Color(0xfffd7e14),
                                ),
                                Text(
                                  snapshot.data == null
                                      ? ""
                                      : "${snapshot.data}",
                                  style: GoogleFonts.getFont(
                                    'Raleway',
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xfffd7e14),
                                  ),
                                ),
                              ],
                            ),
                          ] else if (snapshot.connectionState !=
                                  ConnectionState.waiting &&
                              snapshot.data != null &&
                              snapshot.data == "QR Code not exists" &&
                              dobaraScanKaro(context)) ...[
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(50.0),
                                        child: Image.asset(
                                          'assets/img/qrcode.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: AnimatedCross(
                                        progress: _animation,
                                        size: 200,
                                        color: const Color.fromARGB(
                                            255, 255, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  snapshot.data == null
                                      ? ""
                                      : "${snapshot.data}",
                                  style: GoogleFonts.getFont(
                                    'Raleway',
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xfffd7e14),
                                  ),
                                ),
                              ],
                            ),
                          ] else if (snapshot.connectionState !=
                                  ConnectionState.waiting &&
                              snapshot.data != null &&
                              snapshot.data == "Unauthorized") ...[
                            AlertDialog(
                              title: Text(
                                snapshot.data == null
                                    ? ""
                                    : "${snapshot.data} User. Login Again",
                                style: GoogleFonts.getFont(
                                  'Raleway',
                                  textStyle:
                                      Theme.of(context).textTheme.displayMedium,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xfffd7e14),
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    final a = Logout();
                                    a.logout(context);
                                  },
                                  child: Text(
                                    "OK",
                                    style: GoogleFonts.getFont(
                                      'Raleway',
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ] else if (snapshot.connectionState !=
                                  ConnectionState.waiting &&
                              snapshot.data != null &&
                              dobaraScanKaro(context)) ...[
                            Column(
                              children: [
                                AnimatedCross(
                                  progress: _animation,
                                  size: 200,
                                  color: const Color.fromARGB(255, 255, 0, 0),
                                ),
                                Text(
                                  snapshot.data == null
                                      ? ""
                                      : "${snapshot.data}",
                                  style: GoogleFonts.getFont(
                                    'Raleway',
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(255, 255, 0, 0),
                                  ),
                                ),
                              ],
                            )
                          ]
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  String? uuidextract() {
    const substringToRemove = 'https://festifyer.com/checkin/';
    final resultString = widget.qrData?.replaceAll(substringToRemove, '');
    return resultString;
  }

  Future<String> check2(checkin obj) async {
    return (await obj.checkinF());
  }
}

retrieve(val) async {
  return await val;
}

dobaraScanKaro(context) {
  Future.delayed(
    const Duration(milliseconds: 6000),
    () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ScanQrPage(),
        ),
      );
    },
  );
  return true;
}
