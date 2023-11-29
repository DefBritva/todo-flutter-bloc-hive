import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/todo_service/todo.dart';

part 'start_event.dart';
part 'start_state.dart';

class StartBloc extends Bloc<StartEvent, StartState> {
  final TodoService _todoService;
  StartBloc(
    this._todoService,
  ) : super(const RegisteringServiceState(notes: [])) {
    on<RegisterService>((event, emit) async {
      try {
        await _todoService.init();
        emit(RegisterSuccessfulState(notes: _todoService.getTasks()));
        emit(StartPageState(notes: _todoService.getTasks()));
      } catch (e) {
        emit(RegisterErrorState(error: '$e', notes: _todoService.getTasks()));
      }
    });

    on<LoadTasks>((_, emit) {
      final newState = StartPageState(notes: _todoService.getTasks());
      emit(newState);
    });

    on<CreateButtonPressed>((event, emit) async {
      await _todoService.addTask(event.taskName);
      final newState = state.clone(notes: _todoService.getTasks());
      emit(newState);
    });

    on<DeleteButtonPressed>((event, emit) async {
      await _todoService.deleteTask(event.indexToDelete);
      final newState = state.clone(notes: _todoService.getTasks());
      emit(newState);
    });

    on<DoneButtonPressed>((event, emit) async {
      var note = _todoService.getTasks()[event.index];
      var name = note.name;
      var text = note.text;
      var isDone = note.done;
      await _todoService.completeTask(event.index, name, text, !isDone);
      emit(state.clone(notes: _todoService.getTasks()));
    });

    on<AddFavoriteTask>((event, emit) async {
      final note = _todoService.getTasks()[event.index];
      final name = note.name;
      final text = note.text;
      await _todoService.addFavoriteTask(name, text);
      await _todoService.deleteTask(event.index);
      final newState = state.clone(notes: _todoService.getTasks());
      emit(newState);
    });

    on<ArchiveTask>((event, emit) async {
      await _todoService.archiveTask(event.index);
      final newState = state.clone(notes: _todoService.getTasks());
      emit(newState);
    });

    on<DeleteAllTasks>((event, emit) async {
      await _todoService.deleteAllTasks();
      final newState = state.clone(notes: _todoService.getTasks());
      emit(newState);
    });

    on<StartPageOpen>((_, emit) {
      final newState = StartPageState(notes: _todoService.getTasks());
      emit(newState);
    });
  }
}
