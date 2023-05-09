import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int s = 0;
  int m = 0;
  int h = 0;

  void getCurrentTime() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          s = DateTime.now().second;
          m = DateTime.now().minute;
          h = DateTime.now().hour;
        });
        getCurrentTime();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getCurrentTime();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Align(
          alignment: const Alignment(0, -0.5),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ...List.generate(
                60,
                (index) => Transform.rotate(
                  angle: (index / 60) * (pi * 2),
                  child: Divider(
                    endIndent: size.width * 0.85,
                    color: (index % 5 == 0) ? Colors.red : Colors.grey,
                    thickness: (index % 5 == 0) ? 3 : 2,
                  ),
                ),
              ),
              //SecondHand
              Transform.rotate(
                angle: pi / 2,
                child: Transform.rotate(
                  angle: (s / 60) * (pi * 2),
                  child: Divider(
                    endIndent: size.width * 0.5,
                    indent: size.width * 0.1,
                    color: Colors.black,
                  ),
                ),
              ),
              //MinuteHand
              Transform.rotate(
                angle: pi / 2,
                child: Transform.rotate(
                  angle: (m / 60) * (pi * 2),
                  child: Divider(
                    endIndent: size.width * 0.5,
                    indent: size.width * 0.18,
                    color: Colors.black,
                  ),
                ),
              ),
              //HourHand
              Transform.rotate(
                angle: pi / 2,
                child: Transform.rotate(
                  angle: (h / 12) * (pi * 2),
                  child: Divider(
                    endIndent: size.width * 0.5,
                    indent: size.width * 0.2,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
              ),
              //Dot
              CircleAvatar(
                radius: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
