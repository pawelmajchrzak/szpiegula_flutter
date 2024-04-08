import 'package:flutter/material.dart';
import 'package:szpiegula/screens/set_players_screen.dart';
import 'package:szpiegula/screens/set_spies_screen.dart';
import 'package:szpiegula/screens/set_timer_screen.dart';
import 'package:szpiegula/screens/start_screen.dart';
import 'package:szpiegula/screens/time_screen.dart';



void main() => runApp(SpyApp());

class SpyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Colors.transparent,
      ),
      //home: TimeScreen(5),
      home: StartScreen(),

    );
  }
}

