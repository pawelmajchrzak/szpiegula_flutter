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
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(0xFFcd06e9),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  iconCard,
                  size: 50,
                ),
                Text(
                  '6',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ],
            ),
            Text(
              'Gracze',
              style: TextStyle(
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }


}