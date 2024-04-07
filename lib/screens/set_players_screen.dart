import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/typical_icon_button.dart';
import '../widgets/typical_value_presenter.dart';

class SetPlayersScreen extends StatefulWidget {

  int initialNumberOfPlayers;
  int initialNumberOfSpies;

  SetPlayersScreen(this.initialNumberOfPlayers,this.initialNumberOfSpies);


  @override
  State<SetPlayersScreen> createState() => _SetPlayersScreenState(initialNumberOfPlayers, initialNumberOfSpies);
}

class _SetPlayersScreenState extends State<SetPlayersScreen> {
  int numberOfPlayers;
  int numberOfSpies;
  String alert = '';

  _SetPlayersScreenState(this.numberOfPlayers,this.numberOfSpies);

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
                        if (2*numberOfSpies < numberOfPlayers) {
                          numberOfPlayers--;
                          alert = '';
                        } else {
                          alert = 'Zmniejsz najpierw ilość szpiegów';
                        }

                        //numberOfSpies = (numberOfPlayers/2) as int;
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
            GestureDetector(
              onTap: () {
                print('click');
                //onPress();
                Navigator.pop(context, numberOfPlayers);
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
