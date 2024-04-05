import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:szpiegula/screens/game_screen.dart';
import 'package:szpiegula/screens/set_categories_screen.dart';
import 'package:szpiegula/screens/set_players_screen.dart';
import 'package:szpiegula/screens/set_spies_screen.dart';
import 'package:szpiegula/screens/set_timer_screen.dart';
import 'package:szpiegula/widgets/reusable_card.dart';

import '../constants.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  int numberOfPlayers = 3;
  int numberOfSpies = 1;
  int numberOfMinutes = 5;



  @override
  Widget build(BuildContext context) {
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
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.flag_circle,
                    size: 30,
                  ),
                  Icon(
                    Icons.help,
                    size: 30,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 120,
              child: Text(
                'Konfiguracja',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        kCardColourFirst, Icons.group, numberOfPlayers, 'Gracze', () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SetPlayersScreen(numberOfPlayers);
                      })).then((value) {
                        setState(() {
                          numberOfPlayers = value;
                          print(numberOfPlayers);
                        });
                      });
                    }),
                  ),
                  Expanded(
                    child: ReusableCard(
                        kCardColourSecond, FontAwesomeIcons.userSecret, numberOfSpies, 'Szpiedzy', () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SetSpiesScreen();
                      }
                      ));
                    }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        kCardColourSecond, Icons.timer, numberOfMinutes, 'Czas', () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SetTimerScreen();
                      }
                      ));
                    }),
                  ),
                  Expanded(
                    child: ReusableCard(
                        kCardColourFirst, Icons.interests, 5, 'Sekcje', () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SetCategoriesScreen();
                      }
                      ));
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('click');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GameScreen();
                  }
                  ));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30, bottom: 70, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFF960bf2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      'START',
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