import 'package:flutter/material.dart';
import 'package:szpiegula/widgets/category_card.dart';
import '../constants.dart';
import '../widgets/typical_icon_button.dart';
import '../widgets/typical_value_presenter.dart';

class SetCategoriesScreen extends StatefulWidget {

  List<String> initialCategories;


  SetCategoriesScreen(this.initialCategories);

  @override
  State<SetCategoriesScreen> createState() => _SetCategoriesScreenState(initialCategories);
}

class _SetCategoriesScreenState extends State<SetCategoriesScreen> {
  List<String> categories;
  String alert = '';

  _SetCategoriesScreenState(
      this.categories);

  //List<Color> colorCard = List.filled(6, kCardColourSecond);
  late Color colorCard0 = kCardColourSecond;
  late Color colorCard1 = kCardColourSecond;
  late Color colorCard2 = kCardColourSecond;
  late Color colorCard3 = kCardColourSecond;
  late Color colorCard4 = kCardColourSecond;
  late Color colorCard5 = kCardColourSecond;
  @override
  void initState() {
    super.initState();

      categories.forEach((category) {
        if(category == 'Państwa') {
          colorCard0 = kCardColourFirst;
        } else if (category == 'Obiekty') {
          colorCard1 = kCardColourFirst;
        } else if (category == 'Sport') {
          colorCard2 = kCardColourFirst;
        } else if (category == 'Miejsca') {
          colorCard3 = kCardColourFirst;
        } else if (category == 'Zwierzęta') {
          colorCard4 = kCardColourFirst;
        } else if (category == 'Transport') {
          colorCard5 = kCardColourFirst;
        }
      });




  }

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
                'Sekcje',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),


            Container(
              alignment: Alignment.center,
              child: Text(
                'Wybierz kategorie',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              child: Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: CategoryCard(colorCard0, Icons.flag_circle, 'Państwa', () {
                        setState(() {
                          if(colorCard0 == kCardColourSecond) {
                            categories.add('Państwa');
                            colorCard0 = kCardColourFirst;

                            alert = '';
                          } else if (
                              colorCard1 == kCardColourSecond &&
                              colorCard2 == kCardColourSecond &&
                                  colorCard3 == kCardColourSecond &&
                                  colorCard4 == kCardColourSecond &&
                                  colorCard5 == kCardColourSecond
                          ) {
                            alert = 'Wybierz minimum jedną kategorię';
                          } else {
                            categories.remove('Państwa');
                            colorCard0 = kCardColourSecond;
                            alert = '';
                          }
                        });
                      })),
                      Expanded(child: CategoryCard(colorCard1, Icons.lightbulb, 'Obiekty', () {
                        setState(() {
                          if(colorCard1 == kCardColourSecond) {
                            categories.add('Obiekty');
                            colorCard1 = kCardColourFirst;
                            alert = '';
                          } else if (
                          colorCard0 == kCardColourSecond &&
                              colorCard2 == kCardColourSecond &&
                              colorCard3 == kCardColourSecond &&
                              colorCard4 == kCardColourSecond &&
                              colorCard5 == kCardColourSecond
                          ) {
                            alert = 'Wybierz minimum jedną kategorię';
                          } else {
                            categories.remove('Obiekty');
                            colorCard1 = kCardColourSecond;
                            alert = '';
                          }
                        });
                      })),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Expanded(child: CategoryCard(colorCard2, Icons.sports, 'Sport', () {
                        setState(() {
                          if(colorCard2 == kCardColourSecond) {
                            categories.add('Sport');
                            colorCard2 = kCardColourFirst;
                            alert = '';
                          } else if (
                          colorCard0 == kCardColourSecond &&
                              colorCard1 == kCardColourSecond &&
                              colorCard3 == kCardColourSecond &&
                              colorCard4 == kCardColourSecond &&
                              colorCard5 == kCardColourSecond
                          ) {
                            alert = 'Wybierz minimum jedną kategorię';
                          } else {
                            categories.remove('Sport');
                            colorCard2 = kCardColourSecond;
                            alert = '';
                          }
                        });
                      })),
                      Expanded(child: CategoryCard(colorCard3, Icons.place, 'Miejsca', () {
                        setState(() {
                          if(colorCard3 == kCardColourSecond) {
                            categories.add('Miejsca');
                            colorCard3 = kCardColourFirst;
                            alert = '';
                          } else if (
                          colorCard0 == kCardColourSecond &&
                              colorCard1 == kCardColourSecond &&
                              colorCard2 == kCardColourSecond &&
                              colorCard4 == kCardColourSecond &&
                              colorCard5 == kCardColourSecond
                          ) {
                            alert = 'Wybierz minimum jedną kategorię';
                          } else {
                            categories.remove('Miejsca');
                            colorCard3 = kCardColourSecond;
                            alert = '';
                          }
                        });
                      })),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: CategoryCard(colorCard4, Icons.pets, 'Zwierzęta', () {
                        setState(() {
                          if(colorCard4 == kCardColourSecond) {
                            categories.add('Zwierzęta');
                            colorCard4 = kCardColourFirst;
                            alert = '';
                          } else if (
                          colorCard0 == kCardColourSecond &&
                              colorCard1 == kCardColourSecond &&
                              colorCard2 == kCardColourSecond &&
                              colorCard3 == kCardColourSecond &&
                              colorCard5 == kCardColourSecond
                          ) {
                            alert = 'Wybierz minimum jedną kategorię';
                          } else {
                            categories.remove('Zwierzęta');
                            colorCard4 = kCardColourSecond;
                            alert = '';
                          }
                        });
                      })),
                      Expanded(child: CategoryCard(colorCard5, Icons.flight, 'Transport', () {
                        setState(() {
                          if(colorCard5 == kCardColourSecond) {
                            categories.add('Transport');
                            colorCard5 = kCardColourFirst;
                            alert = '';
                          } else if (
                          colorCard0 == kCardColourSecond &&
                              colorCard1 == kCardColourSecond &&
                              colorCard2 == kCardColourSecond &&
                              colorCard3 == kCardColourSecond &&
                              colorCard4 == kCardColourSecond
                          ) {
                            alert = 'Wybierz minimum jedną kategorię';
                          } else {
                            categories.remove('Transport');
                            colorCard5 = kCardColourSecond;
                            alert = '';
                          }
                        });
                      })),
                    ],
                  ),
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
                Navigator.pop(context,categories);
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
