import 'package:flutter/material.dart';
import '../constants.dart';

class SetPlayersScreen extends StatefulWidget {
  @override
  State<SetPlayersScreen> createState() => _SetPlayersScreenState();
}

class _SetPlayersScreenState extends State<SetPlayersScreen> {
  int numberOfPlayers = 3;
  String namePlayer = 'Pawel';
  TextEditingController _controller = TextEditingController();
  List<TextEditingController> controllers = [];
  final ScrollController _firstController = ScrollController();

  @override
  void initState() {
    _controller.text = "Gracz 1";
    for (int i = 1; i <= numberOfPlayers; i++) {
      controllers.add(TextEditingController(text: "Gracz $i"));
    }
    controllers.forEach((controller) {
      print(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          children: [
            // SizedBox(
            //   height: 90,
            // ),
            Container(
              alignment: Alignment.center,
              height: 120,
              child: Text(
                'Gracze',
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
                      //numbersOfPlayers--;
                      numberOfPlayers = numberOfPlayers > 1 ? numberOfPlayers - 1 : numberOfPlayers;
                      controllers.removeLast(); // Usunięcie ostatniego kontrolera
                    });
                  }, Icons.remove, true),
                  TypicalValuePresenter(numbersOfPlayers: numberOfPlayers),
                  TypicalIconButton(() {
                    setState(() {
                      numberOfPlayers++;
                      controllers.add(TextEditingController(text: 'Gracz $numberOfPlayers'));
                    });
                  }, Icons.add, false),
                ],
              ),
            ),

            Expanded(
              child: Scrollbar(
                //key: UniqueKey(),
                thumbVisibility: false,
                child: ListView.builder(
                  primary: true,
                  shrinkWrap: true,
                  itemCount: numberOfPlayers,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(15),
                      child: TextField(
                        controller: controllers[index],
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          namePlayer = value;
                          print(index);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Container(
              height: 70,
              margin: EdgeInsets.only(top: 10, bottom: 40, left: 10, right: 10),
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
    required this.numbersOfPlayers,
  });

  final int numbersOfPlayers;

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
        numbersOfPlayers.toString(),
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
