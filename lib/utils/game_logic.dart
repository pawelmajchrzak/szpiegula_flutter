import 'dart:math';

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
  return 'banan';
}