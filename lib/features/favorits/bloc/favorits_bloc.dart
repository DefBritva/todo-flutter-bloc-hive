import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/todo_service/todo.dart';

part 'favorits_event.dart';
part 'favorits_state.dart';

class FavoritesBloc extends Bloc<FavoritsEvent, FavoritesState> {
  final TodoService _todoService;
  FavoritesBloc(this._todoService)
      : super(FavoritesPageState(_todoService.getFavoritesTasks())) {
    on<FavoritsEvent>((event, emit) {});

    on<CompleteFavoriteTask>((event, emit) async {
      final task = _todoService.getFavoritesTasks()[event.taskIndex];
      final name = task.name;
      final text = task.text;
      final done = task.done;
      final completedTask = Note(name: name, text: text, done: !done);
      await _todoService.completeFavoriteTask(event.taskIndex, completedTask);
      final newState = FavoritesPageState(_todoService.getFavoritesTasks());
      emit(newState);
    });

    on<UnfavoriteTask>((event, emit) async {
      final note = _todoService.getFavoritesTasks()[event.noteIndex];
      await _todoService.unfavoriteTask(note.name, event.noteIndex);
      final newState = FavoritesPageState(_todoService.getFavoritesTasks());
      emit(newState);
    });

    on<DeleteFavoritePressed>((event, emit) async {
      await _todoService.deleteFavoriteTask(event.indexToDelete);
      final newState = FavoritesPageState(_todoService.getFavoritesTasks());
      emit(newState);
    });

    on<DoneFavoriteTask>((event, emit) async {
      var note = _todoService.getFavoritesTasks()[event.index];
      var name = note.name;
      var text = note.text;
      var isDone = note.done;
      await _todoService.completeTask(event.index, name, text, !isDone);
      emit(FavoritesPageState(_todoService.getFavoritesTasks()));
    });

    on<FavoritesOpen>((event, emit) {
      final newState = FavoritesPageState(_todoService.getFavoritesTasks());
      emit(newState);
    });

    on<ArchiveFavoriteTask>((event, emit) async {
      await _todoService.archiveFavoriteTask(event.index);
      final newState = FavoritesPageState(_todoService.getFavoritesTasks());
      emit(newState);
    });

    on<DeleteAllFavoritesTasks>((event, emit) async {
      await _todoService.deleteAllFavoritesTasks();
      final newState = FavoritesPageState(_todoService.getFavoritesTasks());
      emit(newState);
    });
  }
}
