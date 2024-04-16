import 'dart:math';
import 'package:szpiegula/models/password_manager.dart';

List<int> generateRandomSpies(int numberOfSpies, int numberOfPlayers) {
  List<int> spies = [];
  for (int i = 0; i < numberOfSpies; i++) {
    int randomSpy;
    do {
      randomSpy = Random().nextInt(numberOfPlayers) + 1;
    } while (spies.contains(randomSpy));
    spies.add(randomSpy);
  }
  return spies;
}

String getPassword(List<String> categories) {
  PasswordManager passwordManager = new PasswordManager();
  return passwordManager.getRandomPasswordFromSelectedCategories(categories);
}
