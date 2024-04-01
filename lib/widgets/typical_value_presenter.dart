import 'package:flutter/material.dart';
import '../constants.dart';

class TypicalValuePresenter extends StatelessWidget {
  const TypicalValuePresenter({
    super.key,
    required this.value,
  });

  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        color: kValueColour,
      ),
      child: Text(
        value.toString(),
        style: TextStyle(
          fontSize: 50,
        ),
      ),
    );
  }
}