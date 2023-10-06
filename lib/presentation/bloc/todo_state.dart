// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class InitialState extends TodoState {
  final List<Note> notes;

  const InitialState(this.notes);

  @override
  List<Object?> get props => [notes];
}

class ArchiveState extends TodoState {
  final List<Note> archiveNotes;

  const ArchiveState(this.archiveNotes);

  @override
  List<Object?> get props => [archiveNotes];
}

class StartPageState extends TodoState {
  final List<Note> notes;
  const StartPageState(this.notes);

  @override
  List<Object?> get props => [notes];
}

class NoteOpenedState extends StartPageState {
  final int currentNote;
  const NoteOpenedState(super.notes, this.currentNote);

  @override
  List<Object?> get props => [currentNote];
}

class ArchiveNoteOpenedState extends ArchiveState {
  final int currentNote;

  const ArchiveNoteOpenedState(super.archiveNotes, this.currentNote);
  @override
  List<Object?> get props => [currentNote];
}
