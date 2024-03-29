import 'package:flutter/material.dart';
import '../constants.dart';

class SetTimerScreen extends StatefulWidget {
  @override
  State<SetTimerScreen> createState() => _SetTimerScreenState();
}

class _SetTimerScreenState extends State<SetTimerScreen> {
  int numberOfMinutes = 4;

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFF370f8c), Color(0xFF13072f)],
          ),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 90,
            ),
            Container(
              alignment: Alignment.center,
              height: 120,
              child: Text(
                'Czas',
                style: TextStyle(
                  fontSize: 30,
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
                      numberOfMinutes = numberOfMinutes > 1 ? numberOfMinutes - 1 : numberOfMinutes;
                    });
                  }, Icons.remove, true),
                  TypicalValuePresenter(numbersOfMinutes: numberOfMinutes),
                  TypicalIconButton(() {
                    setState(() {
                      numberOfMinutes++;
                    });
                  }, Icons.add, false),
                ],
              ),
            ),

            SizedBox(
              height: 300,
            ),

            Container(
              height: 70,
              margin: EdgeInsets.only(top: 30, bottom: 70, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Color(0xFF960bf2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: GestureDetector(
                onTap: () {
                  print('click');
                  //onPress();
                },
                child: Center(
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 25,
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

class TypicalValuePresenter extends StatelessWidget {
  const TypicalValuePresenter({
    super.key,
    required this.numbersOfMinutes,
  });

  final int numbersOfMinutes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: kValueColour,
      ),
      child: Text(
        numbersOfMinutes.toString(),
        style: TextStyle(
          fontSize: 35,
        ),
      ),
    );
  }
}

class TypicalIconButton extends StatelessWidget {
  TypicalIconButton(this.onPressed, this.icon, this.isLeft);

  final IconData icon;
  final VoidCallback onPressed;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, size: 30),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 60.0,
        height: 60.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: isLeft ? Radius.circular(30) : Radius.circular(0),
          bottomLeft: isLeft ? Radius.circular(30) : Radius.circular(0),
          topRight: isLeft ? Radius.circular(0) : Radius.circular(30),
          bottomRight: isLeft ? Radius.circular(0) : Radius.circular(30),
        ),
      ),
      fillColor: kCardColourFirst,
    );
  }
}
