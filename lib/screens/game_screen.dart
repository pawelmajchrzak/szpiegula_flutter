import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/category_card.dart';
import '../widgets/typical_icon_button.dart';
import '../widgets/typical_value_presenter.dart';

class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int numberOfSpies = 1;
  String alert = '';
  Color color1 = kCardColourFirst;

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
              height: 70,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Player #1',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                 setState(() {
                   if (color1 == kCardColourFirst) {
                     color1 = kCardColourSecond;
                   } else {
                     color1 = kCardColourFirst;
                   }
                 });
                },
                child: Container(
                  height: 300,
                  width: 200,
                  //padding: EdgeInsets.only(top: 5, bottom: 5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Icon(
                    Icons.remove_red_eye,
                    size: 50,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              child: Icon(
                Icons.ads_click,
                size: 50,

              ),
            ),
            Container(
              child: Text(
                'Naciśnij na kartę wtedy dowiesz się czy jesteś szpiegiem',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,

                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
