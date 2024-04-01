import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/typical_icon_button.dart';
import '../widgets/typical_value_presenter.dart';

class SetSpiesScreen extends StatefulWidget {
  @override
  State<SetSpiesScreen> createState() => _SetSpiesScreenState();
}

class _SetSpiesScreenState extends State<SetSpiesScreen> {
  int numberOfSpies = 1;
  String alert = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: standardDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Szpiedzy',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Ustaw ilość szpiegów',
                style: TextStyle(
                  fontSize: 25,
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
                      if (numberOfSpies > 1) {
                        numberOfSpies--;
                        alert = '';
                      } else {
                        alert = 'Minimalnie 1 szpieg';
                      }
                    });
                  }, Icons.remove, true),
                  TypicalValuePresenter(value: numberOfSpies),
                  TypicalIconButton(() {
                    setState(() {
                      if (numberOfSpies < 5) {
                        numberOfSpies++;
                        alert = '';
                      } else {
                        alert = 'Maksymalnie 50% graczy to szpiedzy';
                      }
                    });
                  }, Icons.add, false),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              child: Text(
                '$alert',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.orange,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('click');
                //onPress();
                Navigator.pop(context);
              },
              child: Container(
                height: 90,
                margin: EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Color(0xFF960bf2),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 30,
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
