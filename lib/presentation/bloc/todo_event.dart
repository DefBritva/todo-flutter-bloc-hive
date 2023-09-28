part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {}

final class LoadNotesEvent extends TodoEvent {
  LoadNotesEvent();
  @override
  List<Object?> get props => [];
}

final class SaveButtonPressed extends TodoEvent {
  final String noteName;
  SaveButtonPressed({required this.noteName});

  @override
  List<Object?> get props => [noteName];
}

final class DeleteButtonPressed extends TodoEvent {
  final int indexToDelete;
  DeleteButtonPressed({required this.indexToDelete});

  @override
  List<Object?> get props => [indexToDelete];
}

final class ArchiveButtonPressed extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class NoteClicked extends TodoEvent {
  @override
  List<Object?> get props => [];
}
