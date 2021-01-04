import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tikitap/Barrier.dart';

import 'tiki.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double tikiYaxis = 0;
  double time = 0;
  double initialheight = tikiYaxis;
  double height = 0;
  bool startgame = false;

  void jump() {
    setState(() {
      time = 0;
      initialheight = tikiYaxis;
    });
  }

  void gameStart() {
    startgame = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.5 * time;
      setState(() {
        tikiYaxis = initialheight - height;
      });

      if (tikiYaxis > 1) {
        timer.cancel();
        startgame = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (startgame) {
                        jump();
                      } else {
                        gameStart();
                      }
                    },
                    child: AnimatedContainer(
                      alignment: Alignment(0, tikiYaxis),
                      duration: Duration(milliseconds: 0),
                      color: Colors.deepPurple,
                      child: Tiki(),
                    ),
                  ),
                  Container(
                    alignment: Alignment(0, -0.3),
                    child: startgame
                        ? Text(" ")
                        : Text(
                            "TAP TO PLAY",
                            style: TextStyle(
                                color: Colors.yellowAccent, fontSize: 30),
                          ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(0, 1.1),
                    duration: Duration(milliseconds: 0),
                    child: Barrier(
                      size: 200.0,
                    ),
                  ),
                ],
              )),
          Container(
            height: 36,
            color: Colors.green,
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
                        "Score",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "0",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Best",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "15",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
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
