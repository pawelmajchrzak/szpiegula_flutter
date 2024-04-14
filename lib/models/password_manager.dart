import 'dart:math';

class PasswordManager {

  Map<String, List<String>> categoriesPasswords = {
    'Państwa': ['hasło11', 'hasło12', 'hasło13'],
    'Obiekty': ['hasło21', 'hasło22', 'hasło23'],
    'Sport': ['hasło31', 'hasło32', 'hasło33'],
    'Miejsca': ['hasło41', 'hasło42', 'hasło43'],
    'Zwierzęta': ['hasło51', 'hasło52', 'hasło53'],
    'Transport': ['hasło61', 'hasło62', 'hasło63'],
  };

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
