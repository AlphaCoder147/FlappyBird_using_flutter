import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flappybird/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdyaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdyaxis;
  bool gameHasStarted = false;
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.white, letterSpacing: 3));
  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdyaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdyaxis = initialHeight - height;
      });
      if (birdyaxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    if (gameHasStarted) {
                      jump();
                    } else {
                      startGame();
                    }
                  },
                  child: AnimatedContainer(
                    alignment: Alignment(0, birdyaxis),
                    duration: Duration(milliseconds: 0),
                    color: Colors.lightBlueAccent,
                    child: MyBird(),
                  ),
                ),
                Container(
                  alignment: Alignment(0, -0.3),
                  child: gameHasStarted
                      ? Text(" ")
                      : Text(
                          "TAP TO PLAY",
                          style: myNewFontWhite.copyWith(fontSize: 20),
                        ),
                ),
              ],
            ),
          ),
          Container(
            height: 15,
            color: Colors.lightGreenAccent,
          ),
          Expanded(
            child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SCORE",
                        style: myNewFontWhite.copyWith(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "0",
                        style: myNewFontWhite.copyWith(fontSize: 35),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "BEST",
                        style: myNewFontWhite.copyWith(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "10",
                        style: myNewFontWhite.copyWith(fontSize: 35),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
