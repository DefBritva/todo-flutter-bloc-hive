import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/services/favorites_task_service.dart';

part 'favorits_event.dart';
part 'favorits_state.dart';

class FavoritesBloc extends Bloc<FavoritsEvent, FavoritesState> {
  final FavoritesTasksService _favoritesService;
  FavoritesBloc(this._favoritesService)
      : super(FavoritesPageState(
            favorits: _favoritesService.getFavoritesTasks())) {
    on<CompleteFavoriteTask>((event, emit) async {
      final task = _favoritesService.getFavoritesTasks()[event.taskIndex];
      final name = task.name;
      final text = task.text;
      final done = task.done;
      final completedTask = Note(name: name, text: text, done: !done);
      await _favoritesService.completeFavoriteTask(
          event.taskIndex, completedTask);
      final newState =
          state.clone(favorits: _favoritesService.getFavoritesTasks());
      emit(newState);
    });

    on<UnfavoriteTask>((event, emit) async {
      final note = _favoritesService.getFavoritesTasks()[event.noteIndex];
      await _favoritesService.unfavoriteTask(note.name, event.noteIndex);
      final newState =
          state.clone(favorits: _favoritesService.getFavoritesTasks());
      emit(newState);
    });

    on<DeleteFavoritePressed>((event, emit) async {
      await _favoritesService.deleteFavoriteTask(event.indexToDelete);
      final newState =
          state.clone(favorits: _favoritesService.getFavoritesTasks());
      emit(newState);
    });

    on<FavoritesOpen>((event, emit) {
      final newState =
          FavoritesPageState(favorits: _favoritesService.getFavoritesTasks());
      emit(newState);
    });

    on<ArchiveFavoriteTask>((event, emit) async {
      await _favoritesService.archiveFavoriteTask(event.index);
      final newState =
          state.clone(favorits: _favoritesService.getFavoritesTasks());
      emit(newState);
    });

    on<DeleteAllFavoritesTasks>((event, emit) async {
      await _favoritesService.deleteAllFavoritesTasks();
      final newState =
          state.clone(favorits: _favoritesService.getFavoritesTasks());
      emit(newState);
    });
  }
}
