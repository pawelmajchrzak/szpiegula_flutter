import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard(this.colorCard, this.iconCard, this.valueCard, this.nameCard, this.onPress);

  final Color colorCard;
  final IconData iconCard;
  final int valueCard;
  final String nameCard;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        padding: EdgeInsets.only(top: 10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colorCard,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  iconCard,
                  size: 55,
                ),
                Text(
                  '$valueCard',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              nameCard,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }


}