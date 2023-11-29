import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/todo_service/todo.dart';

part 'archive_event.dart';
part 'archive_state.dart';

class ArchiveBloc extends Bloc<ArchiveEvent, ArchiveState> {
  final TodoService _todoService;
  ArchiveBloc(this._todoService)
      : super(ArchiveInitial(archive: _todoService.getArchiveTasks())) {
    on<ArchiveEvent>((event, emit) {});

    on<ArchiveOpen>((event, emit) {
      final newState =
          ArchivePageState(archive: _todoService.getArchiveTasks());
      emit(newState);
    });

    on<UnarchiveTask>((event, emit) async {
      final note = _todoService.getArchiveTasks()[event.index];
      if (note.done) {
        await _todoService.unarchiveCompletedTask(event.index);
        final newState =
            ArchivePageState(archive: _todoService.getArchiveTasks());
        emit(newState);
      } else {
        await _todoService.unarchiveTask(event.index);
        final newState =
            ArchivePageState(archive: _todoService.getArchiveTasks());
        emit(newState);
      }
    });

    on<DeleteArchiveTask>((event, emit) async {
      await _todoService.deleteArchiveTask(event.index);
      final newState =
          ArchivePageState(archive: _todoService.getArchiveTasks());
      emit(newState);
    });

    on<DeleteAllArchiveTasks>((event, emit) async {
      await _todoService.deleteAllArchiveTasks();
      final newState =
          ArchivePageState(archive: _todoService.getArchiveTasks());
      emit(newState);
    });
  }
}
