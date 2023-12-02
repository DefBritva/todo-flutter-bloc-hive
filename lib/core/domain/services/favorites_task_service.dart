import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/services/box_service.dart';

// Логика работы страницы FavoritesTasksPage
class FavoritesTasksService {
  Future<void> completeFavoriteTask(int index, Note task) async {
    await favoritesTasksBox.deleteAt(index);
    await completedTasksBox.add(task);
  }

  Future<void> addFavoriteTask(String name, String text) async {
    await favoritesTasksBox.add(Note(name: name, text: text));
  }

  Future<void> deleteFavoriteTask(int index) async {
    await favoritesTasksBox.deleteAt(index);
  }

  List<Note> getFavoritesTasks() {
    return favoritesTasksBox.values.toList();
  }

  Future<void> updateFavoriteTask(
      int index, String name, String text, bool isDone) async {
    await favoritesTasksBox.putAt(
        index, Note(name: name, text: text, done: isDone));
  }

  Future<void> unfavoriteTask(String name, int index) async {
    final text = favoritesTasksBox.getAt(index)?.text ?? '';
    await favoritesTasksBox.deleteAt(index);
    await tasksBox.add(Note(name: name, text: text, done: false));
  }

  Future<void> deleteAllFavoritesTasks() async {
    await favoritesTasksBox.clear();
  }

  Future<void> archiveFavoriteTask(int index) async {
    final note = favoritesTasksBox.getAt(index)!;
    favoritesTasksBox.deleteAt(index);
    archiveTasksBox.add(note);
  }
}
