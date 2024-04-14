import 'package:flutter/material.dart';
import 'package:szpiegula/screens/time_screen.dart';
import '../constants.dart';
import '../utils/game_logic.dart';
import '../widgets/game_comment_text.dart';
import '../widgets/game_icon_widget.dart';
import '../widgets/game_player_number_text.dart';

class GameScreen extends StatefulWidget {
  final int numberOfPlayers;
  final int numberOfSpies;
  final int numberOfMinutes;
  final List<String> categories;

  GameScreen(this.numberOfPlayers, this.numberOfSpies, this.numberOfMinutes,
      this.categories);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int cardRotationNumber = 0;
  int currentPlayer = 1;
  String alert = '';

  double _rotationAngle = 3.14;
  String comment = 'Naciśnij na kartę wtedy dowiesz się czy jesteś szpiegiem';

  bool _isFaceOfCard = false;
  bool _isSpy = true;

  late List<int> randomSpies;
  late int numberOfPlayers;
  late int numberOfSpies;
  late int numberOfMinutes;
  late List<String> categories;
  late String password;
  String note = 'Jesteś szpiegiem';

  @override
  void initState() {
    super.initState();
    initalizeGame();
  }

  void initalizeGame() {
    numberOfPlayers = widget.numberOfPlayers;
    numberOfSpies = widget.numberOfSpies;
    numberOfMinutes = widget.numberOfMinutes;
    categories = widget.categories;
    randomSpies = generateRandomSpies(numberOfSpies, numberOfPlayers);
    password = getPassword(categories);
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
              height: 70,
            ),
            playerNumberText(currentPlayer: currentPlayer),
            cardGesture(context),
            iconWidget(),
            commentText(comment: comment),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Container cardGesture(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onTapCard,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          height: 300,
          width: 200,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: kCardColourSecond,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.white,
                width: 4,
              )),
          transformAlignment: Alignment.center,
          transform: Matrix4.rotationY(_rotationAngle),
          child: Center(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 0),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: _isFaceOfCard
                  ? Text(
                      _isSpy ? note : password,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  : Icon(
                      Icons.remove_red_eye,
                      size: 80,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  void onTapCard() {
    setState(() {
      if (currentPlayer <= numberOfPlayers) {
        if (_rotationAngle == 3.14) {
          _rotationAngle = 0;
          comment = 'Zakryj kartę zanim przekażesz telefon dalej';
        } else {
          _rotationAngle = 3.14;
          currentPlayer++;
          comment = 'Naciśnij na kartę wtedy dowiesz się czy jesteś szpiegiem';
          if (currentPlayer > numberOfPlayers) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TimeScreen(numberOfMinutes)),
            );
          }
        }
        Future.delayed(Duration(milliseconds: 400), () {
          setState(() {
            _isSpy = randomSpies.contains(currentPlayer);
            _isFaceOfCard = !_isFaceOfCard;
          });
        });
      }
    });
  }
}