import 'package:hive_flutter/adapters.dart';
import 'package:my_todo_list/domain/entity/note.dart';

part 'box.dart';

class TodoService {
  Future<void> addNote(String name) async {
    await notesBox.add(Note(name: name));
  }

  Future<void> deleteNote(int index) async {
    await notesBox.deleteAt(index);
  }

  List<Note> getNotes() {
    return notesBox.values.toList();
  }

  Future<void> updateNote(int index, String name, text) async {
    await notesBox.putAt(index, Note(name: name, text: text));
  }
}
