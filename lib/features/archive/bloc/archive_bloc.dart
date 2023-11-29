import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/domain/services/archive_task_service.dart';

part 'archive_event.dart';
part 'archive_state.dart';

class ArchiveBloc extends Bloc<ArchiveEvent, ArchiveState> {
  final ArchiveTasksService _archiveService;
  ArchiveBloc(this._archiveService)
      : super(ArchiveInitial(archive: _archiveService.getArchiveTasks())) {
    on<ArchiveEvent>((event, emit) {});

    on<ArchiveOpen>((event, emit) {
      final newState =
          ArchivePageState(archive: _archiveService.getArchiveTasks());
      emit(newState);
    });

    on<UnarchiveTask>((event, emit) async {
      final note = _archiveService.getArchiveTasks()[event.index];
      if (note.done) {
        await _archiveService.unarchiveCompletedTask(event.index);
        final newState =
            ArchivePageState(archive: _archiveService.getArchiveTasks());
        emit(newState);
      } else {
        await _archiveService.unarchiveTask(event.index);
        final newState =
            ArchivePageState(archive: _archiveService.getArchiveTasks());
        emit(newState);
      }
    });

    on<DeleteArchiveTask>((event, emit) async {
      await _archiveService.deleteArchiveTask(event.index);
      final newState =
          ArchivePageState(archive: _archiveService.getArchiveTasks());
      emit(newState);
    });

    on<DeleteAllArchiveTasks>((event, emit) async {
      await _archiveService.deleteAllArchiveTasks();
      final newState =
          ArchivePageState(archive: _archiveService.getArchiveTasks());
      emit(newState);
    });
  }
}
