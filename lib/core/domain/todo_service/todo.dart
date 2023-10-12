import 'package:hive_flutter/adapters.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';

part 'boxes.dart';

class TodoService {
  Future<void> init() async {
    Hive.registerAdapter(NoteAdapter());
    notesBox = await Hive.openBox<Note>('my_notes');
    completedNotesBox = await Hive.openBox<Note>('my_archiveNotes');
  }

  Future<void> addNote(String name) async {
    await notesBox.add(Note(name: name));
  }

  Future<void> deleteNote(int index) async {
    await notesBox.deleteAt(index);
  }

  List<Note> getNotes() {
    return notesBox.values.toList();
  }

  Future<void> updateNote(
      int index, String name, String text, bool isDone) async {
    await notesBox.putAt(index, Note(name: name, text: text, done: isDone));
  }

  Future<void> completeNote(
      int index, String name, String text, bool isDone) async {
    await notesBox.deleteAt(
        index); // delete current note from start page. Add to archive page
    await completedNotesBox.add(Note(name: name, text: text, done: isDone));
  }

  Future<void> uncompleteNote(String name, int index) async {
    final text = completedNotesBox.getAt(index)?.text ?? '';
    await completedNotesBox.deleteAt(index);
    await notesBox.add(Note(name: name, text: text, done: false));
  }

  Future<void> deleteCompletedNote(int index) async {
    await completedNotesBox.deleteAt(index);
  }

  List<Note> getCompletedNotes() {
    return completedNotesBox.values.toList();
  }
}
