import 'package:flutter/material.dart';
import 'package:szpiegula/widgets/reusable_card.dart';

import 'constants.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
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
            Expanded(
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
            Expanded(
              child: Container(
                child: Text(
                  'Konfiguracja',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        kCardColourFirst,
                        Icons.man_4,
                        6,
                        'Gracze',
                        () {

                        }
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('click');
                        //onPress();
                      },
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xFF5515db),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.man_4,
                                  size: 50,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 50,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Szpiedz',
                              style: TextStyle(
                                fontSize: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('click');
                        //onPress();
                      },
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xFF5515db),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 50,
                                ),
                                Text(
                                  '4',
                                  style: TextStyle(
                                    fontSize: 50,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Czas',
                              style: TextStyle(
                                fontSize: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('click');
                      //onPress();
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(0xFFcd06e9),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.interests,
                                size: 50,
                              ),
                              Text(
                                '5',
                                style: TextStyle(
                                  fontSize: 50,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Sekcje',
                            style: TextStyle(
                              fontSize: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xFF960bf2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: GestureDetector(
                  onTap: () {
                    print('click');
                    //onPress();
                  },
                  child:  Center(
                    child: Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 35,
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


