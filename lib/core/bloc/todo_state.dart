// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class RegisteringServiceState extends TodoState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccessfulState extends TodoState {
  @override
  List<Object?> get props => [];
}

class RegisterErrorState extends TodoState {
  final String error;
  const RegisterErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}

class InitialState extends TodoState {
  final List<Note> notes;

  const InitialState(this.notes);

  @override
  List<Object?> get props => [notes];
}

class CompletedState extends TodoState {
  final List<Note> completedNotes;

  const CompletedState(this.completedNotes);

  @override
  List<Object?> get props => [completedNotes];
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
  List<Object?> get props => [notes, currentNote];
}

class CompletedNoteOpenedState extends CompletedState {
  final int currentNote;

  const CompletedNoteOpenedState(super.completedNotes, this.currentNote);
  @override
  List<Object?> get props => [super.completedNotes, currentNote];
}

class FavoritesState extends TodoState {
  final List<Note> favorits;
  const FavoritesState(this.favorits);

  @override
  List<Object?> get props => [favorits];
}

class FavoriteNoteOpenedState extends FavoritesState {
  final int currentNote;

  const FavoriteNoteOpenedState(super.favorits, this.currentNote);
}

class ArchiveState extends TodoState {
  final List<Note> archive;
  const ArchiveState(this.archive);

  @override
  List<Object?> get props => [archive];
}

class ArchiveNoteOpenedState extends ArchiveState {
  final int currentNote;

  const ArchiveNoteOpenedState(super.archive, this.currentNote);

  @override
  List<Object?> get props => [archive, currentNote];
}
