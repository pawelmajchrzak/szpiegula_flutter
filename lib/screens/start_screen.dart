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
  List<String> categories = [
    'Państwa',
    'Obiekty',
    'Sport',
    'Miejsca',
    'Zwierzęta',
    'Transport'
  ];

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
                  // Icon(
                  //   Icons.flag_circle,
                  //   size: 30,
                  // ),
                  // Icon(
                  //   Icons.help,
                  //   size: 30,
                  // ),
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
                    child: ReusableCard(kCardColourFirst, Icons.group,
                        numberOfPlayers, 'Gracze', () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SetPlayersScreen(numberOfPlayers, numberOfSpies);
                      })).then((value) {
                        setState(() {
                          numberOfPlayers = value;
                        });
                      });
                    }),
                  ),
                  Expanded(
                    child: ReusableCard(
                        kCardColourSecond,
                        FontAwesomeIcons.userSecret,
                        numberOfSpies,
                        'Szpiedzy', () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SetSpiesScreen(numberOfPlayers, numberOfSpies);
                      })).then((value) {
                        setState(() {
                          numberOfSpies = value;
                        });
                      });
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
                        kCardColourSecond, Icons.timer, numberOfMinutes, 'Czas',
                        () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SetTimerScreen(numberOfMinutes);
                      })).then((value) {
                        setState(() {
                          numberOfMinutes = value;
                        });
                      });
                    }),
                  ),
                  Expanded(
                    child: ReusableCard(kCardColourFirst, Icons.interests,
                        categories.length, 'Sekcje', () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SetCategoriesScreen(categories);
                      })).then((value) {
                        setState(() {
                          categories = value;
                        });
                      });
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GameScreen(numberOfPlayers, numberOfSpies,
                        numberOfMinutes, categories);
                  }));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(top: 30, bottom: 70, left: 10, right: 10),
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
