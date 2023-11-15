import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/todo_service/todo.dart';

part 'completed_event.dart';
part 'completed_state.dart';

class CompletedBloc extends Bloc<CompletedEvent, CompletedState> {
  final TodoService _todoService;
  CompletedBloc(this._todoService) : super(CompletedInitial()) {
    on<CompletedEvent>((event, emit) {});

    on<UncompleteTask>((event, emit) async {
      await _todoService.uncompleteTask(event.noteName, event.noteIndex);
      final newState = CompletedPageState(_todoService.getCompletedTasks());
      emit(newState);
    });

    on<DeleteCompletedTask>((event, emit) async {
      await _todoService.deleteCompletedTask(event.indexToDelete);
      final newState = CompletedPageState(_todoService.getCompletedTasks());
      emit(newState);
    });

    on<CompletedOpen>((_, emit) {
      final newState = CompletedPageState(_todoService.getCompletedTasks());
      emit(newState);
    });

    on<ArchiveCompletedTask>((event, emit) async {
      await _todoService.archiveCompletedTask(event.index);
      final newState = CompletedPageState(_todoService.getCompletedTasks());
      emit(newState);
    });

    on<DeleteAllCompletedTasks>((event, emit) async {
      await _todoService.deleteAllCompletedTasks();
      final newState = CompletedPageState(_todoService.getCompletedTasks());
      emit(newState);
    });
  }
}
