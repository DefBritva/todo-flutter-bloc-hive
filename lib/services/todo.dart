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

  Future<void> updateNote(
      int index, String name, String text, bool isDone) async {
    await notesBox.putAt(index, Note(name: name, text: text, done: isDone));
  }

  Future<void> archiveNote(
      int index, String name, String text, bool isDone) async {
    await notesBox.deleteAt(
        index); // delete current note from start page. Add to archive page
    await archiveNotesBox.add(Note(name: name, text: text, done: isDone));
  }

  Future<void> unarchiveNote(String name, int index) async {
    final text = archiveNotesBox.getAt(index)?.text ?? '';
    await archiveNotesBox.deleteAt(index);
    await notesBox.add(Note(name: name, text: text, done: false));
  }

  Future<void> deleteArchiveNote(int index) async {
    await archiveNotesBox.deleteAt(index);
  }

  List<Note> getArchiveNotes() {
    return archiveNotesBox.values.toList();
  }
}
