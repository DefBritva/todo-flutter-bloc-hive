import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/services/completed_task_service.dart';

part 'completed_event.dart';
part 'completed_state.dart';

class CompletedBloc extends Bloc<CompletedEvent, CompletedState> {
  final CompletedTasksService _completedService;
  CompletedBloc(this._completedService)
      : super(CompletedInitial(
            completedTasks: _completedService.getCompletedTasks())) {
    on<CompletedEvent>((event, emit) {});

    on<UncompleteTask>((event, emit) async {
      await _completedService.uncompleteTask(event.noteName, event.noteIndex);
      final newState = CompletedPageState(
          completedTasks: _completedService.getCompletedTasks());
      emit(newState);
    });

    on<DeleteCompletedTask>((event, emit) async {
      await _completedService.deleteCompletedTask(event.indexToDelete);
      final newState = CompletedPageState(
          completedTasks: _completedService.getCompletedTasks());
      emit(newState);
    });

    on<CompletedOpen>((_, emit) {
      final newState = CompletedPageState(
          completedTasks: _completedService.getCompletedTasks());
      emit(newState);
    });

    on<ArchiveCompletedTask>((event, emit) async {
      await _completedService.archiveCompletedTask(event.index);
      final newState = CompletedPageState(
          completedTasks: _completedService.getCompletedTasks());
      emit(newState);
    });

    on<DeleteAllCompletedTasks>((event, emit) async {
      await _completedService.deleteAllCompletedTasks();
      final newState = CompletedPageState(
          completedTasks: _completedService.getCompletedTasks());
      emit(newState);
    });
  }
}
