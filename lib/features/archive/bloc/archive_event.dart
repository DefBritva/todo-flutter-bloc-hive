part of 'archive_bloc.dart';

sealed class ArchiveEvent extends Equatable {
  const ArchiveEvent();
}

final class ArchiveOpen extends ArchiveEvent {
  @override
  List<Object?> get props => [];
}

final class UnarchiveTask extends ArchiveEvent {
  final int index;

  const UnarchiveTask(this.index);

  @override
  List<Object?> get props => [index];
}

final class DeleteArchiveTask extends ArchiveEvent {
  final int index;

  const DeleteArchiveTask(this.index);

  @override
  List<Object?> get props => [index];
}

final class DeleteAllArchiveTasks extends ArchiveEvent {
  @override
  List<Object?> get props => [];
}
