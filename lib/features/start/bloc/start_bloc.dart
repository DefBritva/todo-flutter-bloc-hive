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

    on<CreateButtonPressed>((event, emit) async {
      await _todoService.addTask(event.taskName);
      final newState = StartPageState(_todoService.getTasks());
      emit(newState);
    });

    on<DeleteButtonPressed>((event, emit) async {
      await _todoService.deleteTask(event.indexToDelete);
      final newState = StartPageState(_todoService.getTasks());
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

    on<DoneButtonPressed>((event, emit) async {
      var note = _todoService.getTasks()[event.index];
      var name = note.name;
      var text = note.text;
      var isDone = note.done;
      await _todoService.completeTask(event.index, name, text, !isDone);
      emit(StartPageState(_todoService.getTasks()));
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

    on<ArchiveTask>((event, emit) async {
      await _todoService.archiveTask(event.index);
      final newState = StartPageState(_todoService.getTasks());
      emit(newState);
    });

    on<DeleteAllTasks>((event, emit) async {
      await _todoService.deleteAllTasks();
      final newState = StartPageState(_todoService.getTasks());
      emit(newState);
    });

    on<StartPageOpen>((_, emit) {
      final newState = StartPageState(_todoService.getTasks());
      emit(newState);
    });
  }
}
