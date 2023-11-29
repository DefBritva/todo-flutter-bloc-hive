import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/services/task_service.dart';
import 'package:my_todo_list/core/domain/services/box_service.dart';

part 'start_event.dart';
part 'start_state.dart';

class StartBloc extends Bloc<StartEvent, StartState> {
  final TasksService _taskService;
  final BoxService _boxService;
  StartBloc(
    this._taskService,
    this._boxService,
  ) : super(const RegisteringServiceState(tasks: [])) {
    on<InitServices>((event, emit) async {
      try {
        await _boxService.init();
        emit(RegisterSuccessfulState(tasks: _taskService.getTasks()));
        emit(StartPageState(tasks: _taskService.getTasks()));
      } catch (e) {
        emit(RegisterErrorState(error: '$e', tasks: _taskService.getTasks()));
      }
    });

    on<LoadTasks>((_, emit) {
      final newState = StartPageState(tasks: _taskService.getTasks());
      emit(newState);
    });

    on<CreateButtonPressed>((event, emit) async {
      await _taskService.addTask(event.taskName);
      final newState = state.clone(tasks: _taskService.getTasks());
      emit(newState);
    });

    on<DeleteButtonPressed>((event, emit) async {
      await _taskService.deleteTask(event.indexToDelete);
      final newState = state.clone(tasks: _taskService.getTasks());
      emit(newState);
    });

    on<DoneButtonPressed>((event, emit) async {
      var note = _taskService.getTasks()[event.index];
      var name = note.name;
      var text = note.text;
      var isDone = note.done;
      await _taskService.completeTask(event.index, name, text, !isDone);
      emit(state.clone(tasks: _taskService.getTasks()));
    });

    on<AddFavoriteTask>((event, emit) async {
      final note = _taskService.getTasks()[event.index];
      final name = note.name;
      final text = note.text;
      await _taskService.addFavoriteTask(name, text);
      await _taskService.deleteTask(event.index);
      final newState = state.clone(tasks: _taskService.getTasks());
      emit(newState);
    });

    on<ArchiveTask>((event, emit) async {
      await _taskService.archiveTask(event.index);
      final newState = state.clone(tasks: _taskService.getTasks());
      emit(newState);
    });

    on<DeleteAllTasks>((event, emit) async {
      await _taskService.deleteAllTasks();
      final newState = state.clone(tasks: _taskService.getTasks());
      emit(newState);
    });

    on<StartPageOpen>((_, emit) {
      final newState = StartPageState(tasks: _taskService.getTasks());
      emit(newState);
    });
  }
}
