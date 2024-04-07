import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/category_card.dart';
import '../widgets/typical_icon_button.dart';
import '../widgets/typical_value_presenter.dart';

class GameScreen extends StatefulWidget {

  final int numberOfPlayers;
  final int numberOfSpies;
  final int numberOfMinutes;
  final List<String> categories;


  GameScreen(this.numberOfPlayers, this.numberOfSpies, this.numberOfMinutes,
      this.categories);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {




  String alert = '';
  Color color1 = kCardColourSecond;


  double _rotationAngle = 3.14; // Aktualny kąt obrotu karty
  bool _isSpy = false; // Flaga sprawdzająca czy jesteś szpiegiem
  String comment = 'Naciśnij na kartę wtedy dowiesz się czy jesteś szpiegiem';

  @override
  Widget build(BuildContext context) {
    int numberOfPlayers = widget.numberOfPlayers;
    int numberOfSpies = widget.numberOfSpies;
    int numberOfMinutes = widget.numberOfMinutes;
    List<String> categories = widget.categories;

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
                    if (_rotationAngle == 3.14) {
                      //color1 = kCardColourSecond;
                      _rotationAngle = 0;
                      comment = 'Zakryj kartę zanim przekażesz telefon dalej';
                    } else {
                      //color1 = kCardColourFirst;
                      _rotationAngle = 3.14;
                      comment = 'Naciśnij na kartę wtedy dowiesz się czy jesteś szpiegiem';
                    }
                    //_rotationAngle = _rotationAngle == 0.0 ? 3.14 : 0.0;
                    Future.delayed(Duration(milliseconds: 400), () {
                      setState(() {
                        _isSpy = !_isSpy;
                        //color2 = color1;
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
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    )
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
                            size: 80,
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
                comment,
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
