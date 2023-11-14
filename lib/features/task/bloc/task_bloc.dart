import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/todo_service/todo.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TodoService _todoService;
  TaskBloc(this._todoService) : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {});

    on<TaskOpen>((event, emit) {
      final newState = TaskOpenedState(index: event.index, note: event.note);
      emit(newState);
    });

    on<UpdateTask>((event, emit) async {
      final index = event.index;
      final name = event.name;
      final text = event.text;
      await _todoService.updateNote(index, name, text, false);
      final newState =
          TaskOpenedState(note: Note(name: name, text: text), index: index);
      emit(newState);
    });
  }
}
