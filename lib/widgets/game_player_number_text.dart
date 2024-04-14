import 'package:flutter/material.dart';

class playerNumberText extends StatelessWidget {
  const playerNumberText({
    super.key,
    required this.currentPlayer,
  });

  final int currentPlayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Player #$currentPlayer',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}