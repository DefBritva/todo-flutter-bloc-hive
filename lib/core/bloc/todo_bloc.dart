// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/todo_service/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoService _todoService;
  TodoBloc(
    this._todoService,
  ) : super(RegisteringServiceState()) {
    on<RegisterService>((event, emit) async {
      try {
        await _todoService.init();
        emit(RegisterSuccessfulState());
        emit(StartPageState(_todoService.getTasks()));
      } catch (e) {
        emit(RegisterErrorState(error: '$e'));
      }
    });

    on<LoadTasks>((_, emit) {
      final newState = StartPageState(_todoService.getTasks());
      emit(newState);
    });

    on<SaveButtonPressed>((event, emit) async {
      await _todoService.addTask(event.taskName);
      final newState = StartPageState(_todoService.getTasks());
      emit(newState);
    });

    on<DeleteButtonPressed>((event, emit) async {
      await _todoService.deleteTask(event.indexToDelete);
      final newState = StartPageState(_todoService.getTasks());
      emit(newState);
    });

    on<UpdateTask>((event, emit) async {
      final isDone = _todoService.getTasks()[event.index].done;
      await _todoService.updateNote(
          event.index, event.name, event.text, isDone);
      final newState = NoteOpenedState(_todoService.getTasks(), event.index);
      emit(newState);
    });

    on<TaskClicked>((event, emit) {
      final newState = NoteOpenedState(_todoService.getTasks(), event.index);
      emit(newState);
    });

    on<CompletedTaskClicked>((event, emit) {
      final newState = CompletedNoteOpenedState(
          _todoService.getCompletedTasks(), event.index);
      emit(newState);
    });

    on<CompleteTask>((event, emit) async {
      final note = _todoService.getTasks()[event.taskIndex];
      final name = note.name;
      final text = note.text;
      final done = note.done;
      await _todoService.completeTask(event.taskIndex, name, text, done);
      final newState = StartPageState(_todoService.getTasks());
      emit(newState);
    });

    on<UncompleteTask>((event, emit) async {
      await _todoService.uncompleteTask(event.noteName, event.noteIndex);
      final newState = CompletedState(_todoService.getCompletedTasks());
      emit(newState);
    });

    on<CompleteFavoriteTask>((event, emit) async {
      final task = _todoService.getFavoritesTasks()[event.taskIndex];
      final name = task.name;
      final text = task.text;
      final done = task.done;
      final completedTask = Note(name: name, text: text, done: !done);
      await _todoService.completeFavoriteTask(event.taskIndex, completedTask);
      final newState = FavoritesState(_todoService.getFavoritesTasks());
      emit(newState);
    });

    on<DeleteCompletedTask>((event, emit) async {
      await _todoService.deleteCompletedTask(event.indexToDelete);
      final newState = CompletedState(_todoService.getCompletedTasks());
      emit(newState);
    });

    on<StartPageOpen>((_, emit) {
      final newState = StartPageState(_todoService.getTasks());
      emit(newState);
    });

    on<CompletedOpen>((_, emit) {
      final newState = CompletedState(_todoService.getCompletedTasks());
      emit(newState);
    });

    on<DoneButtonPressed>((event, emit) async {
      var note = _todoService.getTasks()[event.index];
      var name = note.name;
      var text = note.text;
      var isDone = note.done;
      await _todoService.completeTask(event.index, name, text, !isDone);
      emit(StartPageState(_todoService.getTasks()));
    });

    on<UnfavoriteTask>((event, emit) async {
      final note = _todoService.getFavoritesTasks()[event.noteIndex];
      await _todoService.unfavoriteTask(note.name, event.noteIndex);
      final newState = FavoritesState(_todoService.getFavoritesTasks());
      emit(newState);
    });

    on<DeleteFavoritePressed>((event, emit) async {
      await _todoService.deleteFavoriteTask(event.indexToDelete);
      final newState = FavoritesState(_todoService.getFavoritesTasks());
      emit(newState);
    });

    on<DoneFavoriteTask>((event, emit) async {
      var note = _todoService.getFavoritesTasks()[event.index];
      var name = note.name;
      var text = note.text;
      var isDone = note.done;
      await _todoService.completeTask(event.index, name, text, !isDone);
      emit(FavoritesState(_todoService.getFavoritesTasks()));
    });

    on<FavoritesOpen>((event, emit) {
      final newState = FavoritesState(_todoService.getFavoritesTasks());
      emit(newState);
    });

    on<AddFavoriteTask>((event, emit) async {
      final note = _todoService.getTasks()[event.index];
      final name = note.name;
      final text = note.text;
      await _todoService.addFavoriteTask(name, text);
      await _todoService.deleteTask(event.index);
      final newState = StartPageState(_todoService.getTasks());
      emit(newState);
    });

    on<ArchiveOpen>((event, emit) {
      final newState = ArchiveState(_todoService.getArchiveTasks());
      emit(newState);
    });

    on<ArchiveTask>((event, emit) async {
      await _todoService.archiveTask(event.index);
      final newState = StartPageState(_todoService.getTasks());
      emit(newState);
    });

    on<UnarchiveTask>((event, emit) async {
      final note = _todoService.getArchiveTasks()[event.index];
      if (note.done) {
        await _todoService.unarchiveCompletedTask(event.index);
        final newState = ArchiveState(_todoService.getArchiveTasks());
        emit(newState);
      } else {
        await _todoService.unarchiveTask(event.index);
        final newState = ArchiveState(_todoService.getArchiveTasks());
        emit(newState);
      }
    });

    on<ArchiveFavoriteTask>((event, emit) async {
      await _todoService.archiveFavoriteTask(event.index);
      final newState = FavoritesState(_todoService.getFavoritesTasks());
      emit(newState);
    });

    on<ArchiveCompletedTask>((event, emit) async {
      await _todoService.archiveCompletedTask(event.index);
      final newState = CompletedState(_todoService.getCompletedTasks());
      emit(newState);
    });

    on<ArchiveTaskClicked>((event, emit) {
      final newState =
          ArchiveNoteOpenedState(_todoService.getArchiveTasks(), event.index);
      emit(newState);
    });

    on<DeleteArchiveTask>((event, emit) async {
      await _todoService.deleteArchiveTask(event.index);
      final newState = ArchiveState(_todoService.getArchiveTasks());
      emit(newState);
    });

    on<DeleteAllArchiveTasks>((event, emit) async {
      await _todoService.deleteAllArchiveTasks();
      final newState = ArchiveState(_todoService.getArchiveTasks());
      emit(newState);
    });

    on<DeleteAllFavoritesTasks>((event, emit) async {
      await _todoService.deleteAllFavoritesTasks();
      final newState = FavoritesState(_todoService.getFavoritesTasks());
      emit(newState);
    });

    on<DeleteAllTasks>((event, emit) async {
      await _todoService.deleteAllTasks();
      final newState = StartPageState(_todoService.getTasks());
      emit(newState);
    });

    on<DeleteAllCompletedTasks>((event, emit) async {
      await _todoService.deleteAllCompletedTasks();
      final newState = CompletedState(_todoService.getCompletedTasks());
      emit(newState);
    });

    on<FavoriteTaskClicked>((event, emit) {
      final newState = FavoriteNoteOpenedState(
          _todoService.getFavoritesTasks(), event.index);
      emit(newState);
    });

    on<UpdateFavoriteTask>((event, emit) async {
      final isDone = _todoService.getFavoritesTasks()[event.index].done;
      await _todoService.updateFavoriteTask(
          event.index, event.name, event.text, isDone);
      final newState = FavoriteNoteOpenedState(
          _todoService.getFavoritesTasks(), event.index);
      emit(newState);
    });
  }
}
