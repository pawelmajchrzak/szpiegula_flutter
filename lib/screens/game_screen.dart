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

  double _rotationAngle = 3.14; // Aktualny kąt obrotu karty
  bool _isSpy = false; // Flaga sprawdzająca czy jesteś szpiegiem

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
                      _rotationAngle = 0;
                    } else {
                      color1 = kCardColourFirst;
                      _rotationAngle = 3.14;
                    }
                    //_rotationAngle = _rotationAngle == 0.0 ? 3.14 : 0.0;
                    Future.delayed(Duration(milliseconds: 400), () {
                      setState(() {
                        _isSpy = !_isSpy;
                      });
                    });
                  });
                },
                child: AnimatedContainer(
                  //alignment: Alignment.center,
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  height: 300,
                  width: 200,
                  //padding: EdgeInsets.only(top: 5, bottom: 5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  transformAlignment: Alignment.center,
                  transform: Matrix4.rotationY(_rotationAngle),

                  child: _isSpy
                      ? Center(
                          child: Text(
                            'Jesteś szpiegiem',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      : Center(
                          child: Icon(
                            Icons.remove_red_eye,
                            size: 50,
                          ),
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
