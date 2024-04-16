import 'package:flutter/material.dart';
import 'package:szpiegula/widgets/category_card.dart';
import '../constants.dart';

class SetCategoriesScreen extends StatefulWidget {
  List<String> initialCategories;

  SetCategoriesScreen(this.initialCategories);

  @override
  State<SetCategoriesScreen> createState() =>
      _SetCategoriesScreenState(initialCategories);
}

class _SetCategoriesScreenState extends State<SetCategoriesScreen> {
  List<String> categories;
  String alert = '';

  _SetCategoriesScreenState(this.categories);

  late List<Color> colors;

  @override
  void initState() {
    super.initState();
    colors = List.generate(6, (index) => kCardColourSecond);
    categories.forEach((category) {
      switch (category) {
        case 'Państwa':
          colors[0] = kCardColourFirst;
          break;
        case 'Obiekty':
          colors[1] = kCardColourFirst;
          break;
        case 'Sport':
          colors[2] = kCardColourFirst;
          break;
        case 'Miejsca':
          colors[3] = kCardColourFirst;
          break;
        case 'Zwierzęta':
          colors[4] = kCardColourFirst;
          break;
        case 'Transport':
          colors[5] = kCardColourFirst;
          break;
      }
    });
  }

  void toggleCategory(String category, int index) {
    setState(() {
      if (colors[index] == kCardColourSecond) {
        categories.add(category);
        colors[index] = kCardColourFirst;
        alert = '';
      } else if (colors.where((color) => color == kCardColourFirst).length >
          1) {
        categories.remove(category);
        colors[index] = kCardColourSecond;
        alert = '';
      } else {
        alert = 'Wybierz minimum jedną kategorię';
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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: CategoryCard(colors[0], Icons.flag_circle,
                            'Państwa', () => toggleCategory('Państwa', 0))),
                    Expanded(
                        child: CategoryCard(colors[1], Icons.lightbulb,
                            'Obiekty', () => toggleCategory('Obiekty', 1))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: CategoryCard(colors[2], Icons.sports, 'Sport',
                            () => toggleCategory('Sport', 2))),
                    Expanded(
                        child: CategoryCard(colors[3], Icons.place, 'Miejsca',
                            () => toggleCategory('Miejsca', 3))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: CategoryCard(
                            colors[4],
                            Icons.pets,
                            'Zwierzęta',
                            () => toggleCategory('Zwierzęta', 4))),
                    Expanded(
                        child: CategoryCard(
                            colors[5],
                            Icons.flight,
                            'Transport',
                            () => toggleCategory('Transport', 5))),
                  ],
                ),
              ],
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
                Navigator.pop(context, categories);
              },
              child: Container(
                height: 90,
                margin:
                    EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
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
