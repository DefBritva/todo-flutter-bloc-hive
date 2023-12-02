import 'package:flutter/material.dart';

// Навигация по страницам приложения
class AppNavigation {
  static void showNote(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/note');
  }

  static void showCompleted(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/completed');
  }

  static void showFavorites(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/favorites');
  }

  static void showNotes(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/groups');
  }

  static void showArchive(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/archive');
  }

  static void back(BuildContext context) {
    Navigator.of(context).pop();
  }
}
