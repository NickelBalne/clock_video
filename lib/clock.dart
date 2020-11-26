import 'dart:async';
import 'dart:math';

import 'package:clock_video/clock_dail_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {

  double hoursAngle = 0;
  double minutesAngle = 0;
  double secondsAngle = 0;

  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {

      final now = DateTime.now();

      // print("Now:$now");
      // Now:2020-11-13 12:23:34.110993

      // DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

      // DateTime now = dateFormat.parse("2020-11-12 07:00:00.000000");

      setState(() {
        secondsAngle = (pi / 30) * now.second;
        minutesAngle = pi / 30 * now.minute;
        hoursAngle = (pi / 12 * now.hour) + (pi / 45 * minutesAngle);
        // print("HoursAngle:$hoursAngle");
        // print("MinutesAngle:$minutesAngle");
      });


    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        //Clock
        child: Stack(
          children: [
            //dial and numbers go here
            new Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child:new CustomPaint(
                painter: new ClockDialPainter(clockText: ClockText.roman),
              ),
            ),

            //Seconds Hand
            Transform.rotate(
              child: Container(
                child: Container(
                  height: 140,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                alignment: Alignment(0, -0.35),
              ),
              angle: secondsAngle,
            ),

            // Minutes Hand
            Transform.rotate(
              child: Container(
                child: Container(
                  height: 95,
                  width: 5,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                alignment: Alignment(0, -0.35),
              ),
              angle: minutesAngle,
            ),

            //Hour Hand
            Transform.rotate(
              child: Container(
                child: Container(
                  height: 70,
                  width: 7,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                alignment: Alignment(0, -0.2),
              ),
              angle: hoursAngle,
            ),

            //Clock Dot
            Container(
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              alignment: Alignment(0, 0),
            ),

          ],
        ),
        width: 370,
        height: 370,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black45,width: 8),
          borderRadius: BorderRadius.circular(200)
        ),
      ),
      color: Color.fromRGBO(8, 25, 35, 1),
      alignment: Alignment(0, 0),
    );
  }
}
