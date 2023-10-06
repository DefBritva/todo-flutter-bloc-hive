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

final class ArchiveNote extends TodoEvent {
  final String noteName;
  final int noteIndex;

  ArchiveNote(this.noteName, this.noteIndex);
  @override
  List<Object?> get props => [noteName, noteIndex];
}

final class UnnarchiveNote extends TodoEvent {
  final String noteName;
  final int noteIndex;

  UnnarchiveNote(this.noteName, this.noteIndex);
  @override
  List<Object?> get props => [noteName, noteIndex];
}

final class DeleteArchiveNote extends TodoEvent {
  final int indexToDelete;

  DeleteArchiveNote({required this.indexToDelete});

  @override
  List<Object?> get props => [indexToDelete];
}

final class NoteClicked extends TodoEvent {
  final int index;

  NoteClicked(this.index);
  @override
  List<Object?> get props => [];
}

final class ArchiveNoteClicked extends TodoEvent {
  final int index;

  ArchiveNoteClicked(this.index);
  @override
  List<Object?> get props => [index];
}

final class UpdateNoteEvent extends NoteClicked {
  final String name;
  final String text;
  final bool isDone;

  UpdateNoteEvent(super.index, this.name, this.text, this.isDone);
  @override
  List<Object?> get props => [index, name, text];
}

final class ArchiveOpenEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class StartPageOpenEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class DoneButtonPressed extends StartPageOpenEvent {
  final int index;
  final bool isDone;

  DoneButtonPressed(this.index, {required this.isDone});
}
