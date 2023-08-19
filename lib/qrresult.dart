import 'package:animated_cross/animated_cross.dart';
import 'package:flutter/material.dart';
import 'package:scanner_app/appbar.dart';
import 'package:scanner_app/checkin.dart';
import 'package:animated_check/animated_check.dart';
import 'package:audioplayers/audioplayers.dart';
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
    Future<int> val = check2(check);
    return MaterialApp(
      home: Scaffold(
        appBar: NewAppBar(),
        body: Center(
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
                    const Text("Joined Successfully!"),
                  ],
                ),
              ] else ...[
                Column(
                  children: [
                    AnimatedCross(
                      progress: _animation,
                      size: 200,
                      color: Color.fromARGB(255, 255, 0, 0),
                    ),
                    const Text("Please Try Again!"),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: const Color(0xfffd7e14),
                        backgroundColor: const Color(0xfffd7e14),
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'LEMONMILK-Regular',
                            fontSize: 20),
                        fixedSize: const Size(200, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        data = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScanQrPage(),
                          ),
                        );
                      },
                      child: const Text("QR Code Scanner"),
                    ),
                  ],
                )
              ]
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

  Future<int> check2(checkin obj) async {
    return await obj.checkinF();
  }
}
