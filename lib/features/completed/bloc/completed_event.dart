part of 'completed_bloc.dart';

sealed class CompletedEvent extends Equatable {
  const CompletedEvent();
}

final class UncompleteTask extends CompletedEvent {
  final String noteName;
  final int noteIndex;

  const UncompleteTask(this.noteName, this.noteIndex);
  @override
  List<Object?> get props => [noteName, noteIndex];
}

final class DeleteCompletedTask extends CompletedEvent {
  final int indexToDelete;

  const DeleteCompletedTask({required this.indexToDelete});

  @override
  List<Object?> get props => [indexToDelete];
}

final class CompletedOpen extends CompletedEvent {
  @override
  List<Object?> get props => [];
}

final class ArchiveCompletedTask extends CompletedEvent {
  final int index;

  const ArchiveCompletedTask(this.index);

  @override
  List<Object?> get props => [index];
}

final class DeleteAllCompletedTasks extends CompletedEvent {
  @override
  List<Object?> get props => [];
}

final class AddFavoriteTask extends CompletedEvent {
  final int index;

  const AddFavoriteTask(this.index);

  @override
  List<Object?> get props => [index];
}
