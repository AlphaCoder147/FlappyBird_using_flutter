import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {
  final barrierHeight;
  final barrierWidth;
  final barrierX;
  final bool isTheBottomBarrier;
  const MyBarrier({
    this.barrierHeight,
    this.barrierWidth,
    required this.isTheBottomBarrier,
    this.barrierX,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment((2 * barrierX + barrierWidth) / (2 - barrierWidth),
            isTheBottomBarrier ? 1.1 : -1.1),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreenAccent,
            border: Border.all(width: 10, color: (Colors.green[800])!),
            borderRadius: BorderRadius.circular(15),
          ),
          width: MediaQuery.of(context).size.width * barrierWidth / 2,
          height:
              MediaQuery.of(context).size.height * 3 / 4 * barrierHeight / 2,
        ));
  }
}
