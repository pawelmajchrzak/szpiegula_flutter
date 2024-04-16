import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/typical_icon_button.dart';
import '../widgets/typical_value_presenter.dart';

class SetTimerScreen extends StatefulWidget {
  int initialNumberOfMinutes;

  SetTimerScreen(this.initialNumberOfMinutes);

  @override
  State<SetTimerScreen> createState() =>
      _SetTimerScreenState(initialNumberOfMinutes);
}

class _SetTimerScreenState extends State<SetTimerScreen> {
  int numberOfMinutes;
  String alert = '';

  _SetTimerScreenState(this.numberOfMinutes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: standardDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Czas',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Ustaw czas rozgrywki',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TypicalIconButton(() {
                    setState(() {
                      if (numberOfMinutes > 1) {
                        numberOfMinutes--;
                        alert = '';
                      } else {
                        alert = 'Ustaw czas pomiędzy 1 a 10 minut';
                      }
                    });
                  }, Icons.remove, true),
                  TypicalValuePresenter(value: numberOfMinutes),
                  TypicalIconButton(() {
                    setState(() {
                      if (numberOfMinutes < 10) {
                        numberOfMinutes++;
                        alert = '';
                      } else {
                        alert = 'Ustaw czas pomiędzy 1 a 10 minut';
                      }
                    });
                  }, Icons.add, false),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              child: Text(
                '$alert',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.orange,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, numberOfMinutes);
              },
              child: Container(
                height: 90,
                margin:
                    EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Color(0xFF960bf2),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 30,
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
