import 'package:hive_flutter/adapters.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';

part 'boxes.dart';

class TodoService {
  Future<void> init() async {
    Hive.registerAdapter(NoteAdapter());
    tasksBox = await Hive.openBox<Note>('myNotes');
    completedTasksBox = await Hive.openBox<Note>('myArchiveNotes');
    favoritesTasksBox = await Hive.openBox<Note>('favoritesNote');
    archiveTasksBox = await Hive.openBox<Note>('archiveNotes');
  }

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

  Future<void> updateNote(
      int index, String name, String text, bool isDone) async {
    await tasksBox.putAt(index, Note(name: name, text: text, done: isDone));
  }

  Future<void> completeTask(
      int index, String name, String text, bool isDone) async {
    await tasksBox.deleteAt(
        index); // delete current note from start page. Add to completed page
    await completedTasksBox.add(Note(name: name, text: text, done: isDone));
  }

  Future<void> completeFavoriteTask(int index, Note task) async {
    await favoritesTasksBox.deleteAt(index);
    await completedTasksBox.add(task);
  }

  Future<void> uncompleteTask(String name, int index) async {
    final text = completedTasksBox.getAt(index)?.text ?? '';
    await completedTasksBox.deleteAt(index);
    await tasksBox.add(Note(name: name, text: text, done: false));
  }

  Future<void> deleteCompletedTask(int index) async {
    await completedTasksBox.deleteAt(index);
  }

  List<Note> getCompletedTasks() {
    return completedTasksBox.values.toList();
  }

  Future<void> deleteAllCompletedTasks() async {
    await completedTasksBox.clear();
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

  Future<void> archiveTask(int index) async {
    final note = tasksBox.getAt(index)!;
    tasksBox.deleteAt(index);
    archiveTasksBox.add(note);
  }

  Future<void> archiveFavoriteTask(int index) async {
    final note = favoritesTasksBox.getAt(index)!;
    favoritesTasksBox.deleteAt(index);
    archiveTasksBox.add(note);
  }

  Future<void> archiveCompletedTask(int index) async {
    final note = completedTasksBox.getAt(index)!;
    completedTasksBox.deleteAt(index);
    archiveTasksBox.add(note);
  }

  Future<void> deleteArchiveTask(int index) async {
    await archiveTasksBox.deleteAt(index);
  }

  Future<void> unarchiveTask(int index) async {
    final note = archiveTasksBox.getAt(index)!;
    await archiveTasksBox.deleteAt(index);
    await tasksBox.add(note);
  }

  Future<void> unarchiveCompletedTask(int index) async {
    final note = archiveTasksBox.getAt(index)!;
    await archiveTasksBox.deleteAt(index);
    await completedTasksBox.add(note);
  }

  List<Note> getArchiveTasks() {
    return archiveTasksBox.values.toList();
  }

  Future<void> deleteAllArchiveTasks() async {
    await archiveTasksBox.clear();
  }
}
