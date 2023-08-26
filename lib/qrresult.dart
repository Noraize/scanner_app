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
    Future.delayed(const Duration(milliseconds: 6000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ScanQrPage(),
        ),
      );
    });
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
              child: Icon(
                Icons.logout_outlined,
                color: Colors.orange,
              ),
            ),
          )
        ]),
        body: Column(
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (val == 200) ...[
                    Column(
                      children: [
                        AnimatedCheck(
                          progress: _animation,
                          size: 200,
                          color: const Color(0xfffd7e14),
                        ),
                        Text(
                          "Successful! Response Code: 200",
                          style: GoogleFonts.getFont(
                            'Raleway',
                            textStyle:
                                Theme.of(context).textTheme.displayMedium,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xfffd7e14),
                          ),
                        ),
                      ],
                    ),
                  ] else if (val == 404) ...[
                    Column(
                      children: [
                        Text(
                          "Could not find QR Code! Response Code: 404",
                          style: GoogleFonts.getFont(
                            'Raleway',
                            textStyle:
                                Theme.of(context).textTheme.displayMedium,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xfffd7e14),
                          ),
                        ),
                        Stack(
                          children: [
                            AnimatedCross(
                              progress: _animation,
                              size: 200,
                              color: const Color.fromARGB(255, 255, 0, 0),
                            ),
                            Image.asset(
                              'qrcode.png',
                              width: 200,
                              height: 200,
                            )
                          ],
                        ),
                      ],
                    )
                  ] else ...[
                    FutureBuilder(
                        future: val,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text("An error occurred");
                          } else {
                            return Column(
                              children: [
                                AnimatedCross(
                                  progress: _animation,
                                  size: 200,
                                  color: const Color.fromARGB(255, 255, 0, 0),
                                ),
                                Text(
                                  "${snapshot.data}",
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
                            );
                          }
                        }),
                  ],
                ],
              ),
            ),
          ],
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
