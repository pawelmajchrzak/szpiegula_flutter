import 'package:flutter/material.dart';
import '../constants.dart';

class CategoryCard extends StatelessWidget {

  CategoryCard(this.colorCard, this.iconCard, this.nameCard, this.onPress);

  final Color colorCard;
  final IconData iconCard;
  final String nameCard;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        padding: EdgeInsets.only(top: 15, bottom: 5),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colorCard,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Icon(
              iconCard,
              size: 50,
            ),
            Text(
              nameCard,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }


}