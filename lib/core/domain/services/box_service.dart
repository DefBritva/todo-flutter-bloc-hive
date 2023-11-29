import 'package:hive_flutter/adapters.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';

part 'boxes.dart';

class BoxService {
  Future<void> init() async {
    Hive.registerAdapter(NoteAdapter());
    tasksBox = await Hive.openBox<Note>('myNotes');
    completedTasksBox = await Hive.openBox<Note>('myArchiveNotes');
    favoritesTasksBox = await Hive.openBox<Note>('favoritesNote');
    archiveTasksBox = await Hive.openBox<Note>('archiveNotes');
  }
}
