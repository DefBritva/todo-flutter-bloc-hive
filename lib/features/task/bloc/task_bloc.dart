import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/todo_service/todo.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TodoService _todoService;
  TaskBloc(this._todoService)
      : super(const TaskInitial(index: 0, note: Note(name: ''))) {
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

    on<FavoriteTaskOpen>((event, emit) {
      final newState =
          FavoriteTaskOpenedState(index: event.index, note: event.note);
      emit(newState);
    });

    on<UpdateFavoriteTask>((event, emit) async {
      final isDone = _todoService.getFavoritesTasks()[event.index].done;
      final name = event.name;
      final text = event.text;
      await _todoService.updateFavoriteTask(
          event.index, event.name, event.text, isDone);
      final newState = FavoriteTaskOpenedState(
          index: event.index, note: Note(name: name, text: text));
      emit(newState);
    });
    on<ArchiveTaskOpen>((event, emit) {
      final newState =
          ArchiveNoteOpenedState(index: event.index, note: event.note);
      emit(newState);
    });

    on<CompletedTaskOpen>((event, emit) {
      final newState =
          CompletedNoteOpenedState(index: event.index, note: event.note);
      emit(newState);
    });
  }
}
