import 'package:flappybird/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoverPage extends StatelessWidget {
  const CoverPage({super.key});
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.lightBlueAccent,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    alignment: const Alignment(0, 0.5),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'home');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent),
                    child: Text(
                      "PLAY",
                      style: myNewFontWhite.copyWith(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.lightGreenAccent,
            height: 10,
          ),
          Expanded(
            child: Container(
              color: Colors.brown,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "@ALPHAPANTHERKILO",
                      style: myNewFontWhite.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
