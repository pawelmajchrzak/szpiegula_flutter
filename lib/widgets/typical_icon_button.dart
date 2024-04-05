import 'package:flutter/material.dart';
import '../constants.dart';

class TypicalIconButton extends StatelessWidget {
  TypicalIconButton(this.onPressed, this.icon, this.isLeft);

  final IconData icon;
  final VoidCallback onPressed;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, size: 45),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 90.0,
        height: 90.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: isLeft ? Radius.circular(30) : Radius.circular(0),
          bottomLeft: isLeft ? Radius.circular(30) : Radius.circular(0),
          topRight: isLeft ? Radius.circular(0) : Radius.circular(30),
          bottomRight: isLeft ? Radius.circular(0) : Radius.circular(30),
        ),
      ),
      fillColor: kCardColourFirst,
    );
  }
}