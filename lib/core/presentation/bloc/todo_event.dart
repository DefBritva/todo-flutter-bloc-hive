part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {}

final class RegisterService extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class LoadNotes extends TodoEvent {
  LoadNotes();
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

final class CompletedNote extends TodoEvent {
  final int noteIndex;

  CompletedNote(this.noteIndex);
  @override
  List<Object?> get props => [noteIndex];
}

final class UnnarchiveNote extends TodoEvent {
  final String noteName;
  final int noteIndex;

  UnnarchiveNote(this.noteName, this.noteIndex);
  @override
  List<Object?> get props => [noteName, noteIndex];
}

final class DeleteCompletedNote extends TodoEvent {
  final int indexToDelete;

  DeleteCompletedNote({required this.indexToDelete});

  @override
  List<Object?> get props => [indexToDelete];
}

final class NoteClicked extends TodoEvent {
  final int index;

  NoteClicked(this.index);
  @override
  List<Object?> get props => [index];
}

final class CompletedNoteClicked extends TodoEvent {
  final int index;

  CompletedNoteClicked(this.index);
  @override
  List<Object?> get props => [index];
}

final class UpdateNote extends TodoEvent {
  final int index;
  final String name;
  final String text;

  UpdateNote(this.index, this.name, this.text);
  @override
  List<Object?> get props => [index, name, text];
}

final class CompletedOpen extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class StartPageOpen extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class DoneButtonPressed extends TodoEvent {
  final int index;

  DoneButtonPressed(
    this.index,
  );

  @override
  List<Object?> get props => [index];
}
