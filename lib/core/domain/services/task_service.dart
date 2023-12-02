import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/services/box_service.dart';

// Логика работы страницы StartPage
class TasksService {
  Future<void> addTask(String name) async {
    await tasksBox.add(Note(name: name));
  }

  Future<void> deleteTask(int index) async {
    await tasksBox.deleteAt(index);
  }

  List<Note> getTasks() {
    return tasksBox.values.toList();
  }

  Future<void> deleteAllTasks() async {
    await tasksBox.clear();
  }

  Future<void> updateTask(int index, Note note) async {
    await tasksBox.putAt(index, note);
  }

  Future<void> completeTask(
      int index, String name, String text, bool isDone) async {
    await tasksBox.deleteAt(
        index); // delete current note from start page. Add to completed page
    await completedTasksBox.add(Note(name: name, text: text, done: isDone));
  }

  Future<void> archiveTask(int index) async {
    final note = tasksBox.getAt(index)!;
    tasksBox.deleteAt(index);
    archiveTasksBox.add(note);
  }

  Future<void> addFavoriteTask(String name, String text) async {
    await favoritesTasksBox.add(Note(name: name, text: text));
  }
}
