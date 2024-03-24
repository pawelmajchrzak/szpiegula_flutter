import 'package:flutter/material.dart';
import 'package:szpiegula/screens/set_players_screen.dart';
import 'package:szpiegula/screens/start_screen.dart';


void main() => runApp(SpyApp());

class SpyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: SetPlayersScreen(),
    );
  }
}

