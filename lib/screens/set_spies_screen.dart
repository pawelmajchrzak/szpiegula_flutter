import 'package:flutter/material.dart';
import '../constants.dart';

class SetSpiesScreen extends StatefulWidget {
  @override
  State<SetSpiesScreen> createState() => _SetSpiesScreenState();
}

class _SetSpiesScreenState extends State<SetSpiesScreen> {
  int numberOfSpies = 1;

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFF370f8c), Color(0xFF13072f)],
          ),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 90,
            ),
            Container(
              alignment: Alignment.center,
              height: 120,
              child: Text(
                'Szpiedzy',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TypicalIconButton(() {
                    setState(() {
                      numberOfSpies = numberOfSpies > 1 ? numberOfSpies - 1 : numberOfSpies;
                    });
                  }, Icons.remove, true),
                  TypicalValuePresenter(numbersOfSpies: numberOfSpies),
                  TypicalIconButton(() {
                    setState(() {
                      numberOfSpies++;
                    });
                  }, Icons.add, false),
                ],
              ),
            ),

            SizedBox(
              height: 300,
            ),

            Container(
              height: 70,
              margin: EdgeInsets.only(top: 30, bottom: 70, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Color(0xFF960bf2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: GestureDetector(
                onTap: () {
                  print('click');
                  //onPress();
                },
                child: Center(
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 25,
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

class TypicalValuePresenter extends StatelessWidget {
  const TypicalValuePresenter({
    super.key,
    required this.numbersOfSpies,
  });

  final int numbersOfSpies;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: kValueColour,
      ),
      child: Text(
        numbersOfSpies.toString(),
        style: TextStyle(
          fontSize: 35,
        ),
      ),
    );
  }
}

class TypicalIconButton extends StatelessWidget {
  TypicalIconButton(this.onPressed, this.icon, this.isLeft);

  final IconData icon;
  final VoidCallback onPressed;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, size: 30),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 60.0,
        height: 60.0,
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
