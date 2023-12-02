import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/services/box_service.dart';

// Логика работы страницы ArchiveTasksPage
class ArchiveTasksService {
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
