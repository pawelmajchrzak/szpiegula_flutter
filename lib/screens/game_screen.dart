import 'package:flutter/material.dart';
import 'package:szpiegula/screens/start_screen.dart';
import 'package:szpiegula/screens/time_screen.dart';
import '../constants.dart';
import '../widgets/category_card.dart';
import '../widgets/typical_icon_button.dart';
import '../widgets/typical_value_presenter.dart';
import 'dart:math';

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

  int cardRotationNumber = 0;
  int currentPlayer = 1;


  String alert = '';
  Color color1 = kCardColourSecond;


  double _rotationAngle = 3.14; // Aktualny kąt obrotu karty
  bool _isSpy = false; // Flaga sprawdzająca czy jesteś szpiegiem
  String comment = 'Naciśnij na kartę wtedy dowiesz się czy jesteś szpiegiem';

  bool _isTrue = true;


  late List<int> randomSpies;

  @override
  void initState() {
    super.initState();
    randomSpies = generateRandomSpies(widget.numberOfSpies, widget.numberOfPlayers);
    print(randomSpies);
  }

  @override
  Widget build(BuildContext context) {
    int numberOfPlayers = widget.numberOfPlayers;
    int numberOfSpies = widget.numberOfSpies;
    int numberOfMinutes = widget.numberOfMinutes;
    List<String> categories = widget.categories;
    String password = 'Gitara';
    String note = 'Jesteś szpiegiem';
    String display = password;
    //List<int> randomSpies = generateRandomSpies(numberOfSpies, numberOfPlayers);
    //print(randomSpies);


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
                'Player #$currentPlayer',
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
                    //print(currentPlayer);
                    //print(numberOfPlayers);

                    if (currentPlayer <= numberOfPlayers) {

                      if (_rotationAngle == 3.14) {
                        //color1 = kCardColourSecond;
                        _rotationAngle = 0;
                        comment = 'Zakryj kartę zanim przekażesz telefon dalej';
                      } else {
                        //color1 = kCardColourFirst;
                        _rotationAngle = 3.14;
                        currentPlayer++;
                        //print(currentPlayer);
                        comment = 'Naciśnij na kartę wtedy dowiesz się czy jesteś szpiegiem';
                        if(currentPlayer > numberOfPlayers) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return TimeScreen(numberOfMinutes);
                          }));
                        }

                      }
                      //_rotationAngle = _rotationAngle == 0.0 ? 3.14 : 0.0;
                      Future.delayed(Duration(milliseconds: 400),  () {
                        setState(() {
                          if(randomSpies.contains(currentPlayer)) {
                            _isTrue = true;
                            display = note;
                          } else {
                            _isTrue = false;
                            display = password;
                          }
                          _isSpy = !_isSpy;

                          //print(display);
                          //color2 = color1;
                        });
                      });
                    }
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

                  child: Center(
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 0),
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInOut,
                      child: _isSpy
                          ? Text(

                            _isTrue ? note : password, //tu nie zmienia się to wogóle- jakby widzi tylko wartość początkową
                            //note,
                            //key: ValueKey<String>(_isSpy.toString()),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                          : Icon(
                            Icons.remove_red_eye,
                            //key: ValueKey<String>(_isSpy.toString()),
                            size: 80,
                          ),
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

List<int> generateRandomSpies(int numberOfSpies, int numberOfPlayers) {
  List<int> spies = [];

  for (int i = 0; i < numberOfSpies; i++) {
    int randomSpy;
    do {
      randomSpy = Random().nextInt(numberOfPlayers) + 1;
    } while (spies.contains(randomSpy));

    spies.add(randomSpy);
  }

  return spies;
}