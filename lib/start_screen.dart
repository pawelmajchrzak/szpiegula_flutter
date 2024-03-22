import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFF370f8c), Color(0xFF13072f)],
          ),
        ),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.flag_circle),
                  Icon(Icons.help),

                ],
              ),
            ),
            Expanded(
              child: Container (
                child: const Text (
                  'Konfiguracja',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container (
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Color(0xFFcd06e9),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Expanded(
              child: Container (
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Color(0xFF5515db),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Expanded(
              child: Container (
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Color(0xFF960bf2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
