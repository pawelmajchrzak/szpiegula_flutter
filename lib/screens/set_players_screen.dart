import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/typical_icon_button.dart';
import '../widgets/typical_value_presenter.dart';

class SetPlayersScreen extends StatefulWidget {
  @override
  State<SetPlayersScreen> createState() => _SetPlayersScreenState();
}

class _SetPlayersScreenState extends State<SetPlayersScreen> {
  int numberOfPlayers = 1;
  String alert = '';

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
                'Gracze',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Ustaw ilość graczy',
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
                      if (numberOfPlayers > 3) {
                        numberOfPlayers--;
                        alert = '';
                      } else {
                        alert = 'Minimalnie 3 graczy';
                      }
                    });
                  }, Icons.remove, true),
                  TypicalValuePresenter(value: numberOfPlayers),
                  TypicalIconButton(() {
                    setState(() {
                      if (numberOfPlayers < 10) {
                        numberOfPlayers++;
                        alert = '';
                      } else {
                        alert = 'Maksymalnie 10 graczy ';
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
            Container(
              height: 90,
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
              decoration: BoxDecoration(
                color: Color(0xFF960bf2),
                borderRadius: BorderRadius.circular(30.0),
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
