import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/services/box_service.dart';

class CompletedTasksService {
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

  Future<void> archiveCompletedTask(int index) async {
    final note = completedTasksBox.getAt(index)!;
    completedTasksBox.deleteAt(index);
    archiveTasksBox.add(note);
  }
}
