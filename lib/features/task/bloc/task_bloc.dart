import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/services/favorites_task_service.dart';
import 'package:my_todo_list/core/domain/services/task_service.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TasksService _taskService;
  final FavoritesTasksService _favoritesTasksService;
  TaskBloc(this._taskService, this._favoritesTasksService)
      : super(const TaskOpenedState(index: 0, task: Note(name: ''))) {
    on<TaskOpen>((event, emit) {
      final newState = TaskOpenedState(index: event.index, task: event.task);
      emit(newState);
    });

    on<UpdateTask>((event, emit) async {
      final index = state.index;
      final task = event.task;

      await _taskService.updateTask(index, task);
      final newState = state.clone(task: task);
      emit(newState);
    });

    on<FavoriteTaskOpen>((event, emit) {
      final newState =
          FavoriteTaskOpenedState(index: event.index, task: event.task);
      emit(newState);
    });

    on<UpdateFavoriteTask>((event, emit) async {
      final isDone =
          _favoritesTasksService.getFavoritesTasks()[event.index].done;
      final name = event.task.name;
      final text = event.task.text;
      await _favoritesTasksService.updateFavoriteTask(
          event.index, event.task.name, event.task.text, isDone);
      final newState =
          state.clone(index: event.index, task: Note(name: name, text: text));
      emit(newState);
    });
    on<ArchiveTaskOpen>((event, emit) {
      final newState =
          ArchiveTaskOpenedState(index: event.index, task: event.task);
      emit(newState);
    });

    on<CompletedTaskOpen>((event, emit) {
      final newState =
          CompletedTaskOpenedState(index: event.index, task: event.task);
      emit(newState);
    });
  }
}
