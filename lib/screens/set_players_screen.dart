import 'package:flutter/material.dart';
import '../constants.dart';

class SetPlayersScreen extends StatefulWidget {

  @override
  State<SetPlayersScreen> createState() => _SetPlayersScreenState();
}

class _SetPlayersScreenState extends State<SetPlayersScreen> {

  int numbersOfPlayers = 3;

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
          children: [
            SizedBox(
              height: 90,
            ),
            Container(
              alignment: Alignment.center,
              height: 120,
              child: Text(
                'Gracze',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundIconButton(
                    () {
                      setState(() {
                        numbersOfPlayers--;
                      });
                    },
                    Icons.remove,
                    true
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF400b75),

                    ),
                    child: Text(
                        numbersOfPlayers.toString(),
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                  ),
                  RoundIconButton(
                          () {
                            setState(() {
                              numbersOfPlayers++;
                            });
                      },
                      Icons.add,
                      false
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
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

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.onPressed, this.icon, this.isLeft);

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
            bottomLeft: isLeft ?  Radius.circular(30) : Radius.circular(0),
            topRight: isLeft ? Radius.circular(0) : Radius.circular(30),
            bottomRight: isLeft ? Radius.circular(0) : Radius.circular(30),
        ),
      ),
      fillColor: kCardColourFirst,
    );
  }
}
