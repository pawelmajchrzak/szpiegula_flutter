import 'dart:math';
import 'package:szpiegula/models/passwords.dart';

class PasswordManager extends Passwords{

  String getRandomPasswordFromSelectedCategories(List<String> selectedCategories) {
    List<String> allSelectedPasswords = [];

    selectedCategories.forEach((category) {
      if (categoriesPasswords.containsKey(category)) {
        allSelectedPasswords.addAll(categoriesPasswords[category]!);
      }
    });

    if (allSelectedPasswords.isEmpty) {
      throw Exception('Nie znaleziono haseł dla podanych kategorii.');
    }

    return allSelectedPasswords[Random().nextInt(allSelectedPasswords.length)];
  }

}
