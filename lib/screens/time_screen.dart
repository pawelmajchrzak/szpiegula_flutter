import 'dart:async';

import 'package:flutter/material.dart';
import '../constants.dart';
class TimeScreen extends StatefulWidget {

   final int numberOfMinutes;

   TimeScreen(this.numberOfMinutes);

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {

  late int minutes;
  late int seconds;
  bool timeUp = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    minutes = widget.numberOfMinutes;
    seconds = 0;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        if (minutes == 0) {
          setState(() {
            timeUp = true;
          });
          timer.cancel();
        } else {
          setState(() {
            minutes--;
            seconds = 59;
          });
        }
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    int numberOfMinutes = widget.numberOfMinutes;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFF370f8c), Color(0xFF13072f)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 70,
            ),
            Text (
              'Pozostało czasu:',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Icon (
              Icons.timer,
              size: 100,
            ),
            Text(
              '${minutes.toString()}:${seconds.toString().padLeft(2, '0')}',
              style: TextStyle(
                fontSize: 80,
              ),
            ),
            if (timeUp)
              Text(
                'Koniec czasu!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),
              ),

            SizedBox(
              height: 30,
            ),
            Container(
              height: 170,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30, bottom: 70, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFF960bf2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      'Nowa gra',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
