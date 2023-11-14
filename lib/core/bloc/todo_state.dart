// // ignore_for_file: public_member_api_docs, sort_constructors_first
// part of 'todo_bloc.dart';

// sealed class TodoState1 extends Equatable {
//   const TodoState1();
// }

// class RegisteringServiceState1 extends TodoState1 {
//   @override
//   List<Object?> get props => [];
// }

// class RegisterSuccessfulState1 extends TodoState1 {
//   @override
//   List<Object?> get props => [];
// }

// class RegisterErrorState1 extends TodoState1 {
//   final String error;
//   const RegisterErrorState1({
//     required this.error,
//   });
//   @override
//   List<Object?> get props => [error];
// }

// class InitialState1 extends TodoState1 {
//   final List<Note> notes;

//   const InitialState1(this.notes);

//   @override
//   List<Object?> get props => [notes];
// }

// class CompletedState1 extends TodoState1 {
//   final List<Note> completedNotes;

//   const CompletedState1(this.completedNotes);

//   @override
//   List<Object?> get props => [completedNotes];
// }

// class StartPageStateeeeee extends TodoState1 {
//   final List<Note> notes;
//   const StartPageStateeeeee(this.notes);

//   @override
//   List<Object?> get props => [notes];
// }

// class NoteOpenedState1 extends StartPageStateeeeee {
//   final int currentNote;
//   const NoteOpenedState1(super.notes, this.currentNote);

//   @override
//   List<Object?> get props => [notes, currentNote];
// }

// class CompletedNoteOpenedState1 extends CompletedState1 {
//   final int currentNote;

//   const CompletedNoteOpenedState1(super.completedNotes, this.currentNote);
//   @override
//   List<Object?> get props => [super.completedNotes, currentNote];
// }

// class FavoritesState1 extends TodoState1 {
//   final List<Note> favorits;
//   const FavoritesState1(this.favorits);

//   @override
//   List<Object?> get props => [favorits];
// }

// class FavoriteNoteOpenedState1 extends FavoritesState1 {
//   final int currentNote;

//   const FavoriteNoteOpenedState1(super.favorits, this.currentNote);
// }

// class ArchiveState1 extends TodoState1 {
//   final List<Note> archive;
//   const ArchiveState1(this.archive);

//   @override
//   List<Object?> get props => [archive];
// }

// class ArchiveNoteOpenedState1 extends ArchiveState1 {
//   final int currentNote;

//   const ArchiveNoteOpenedState1(super.archive, this.currentNote);

//   @override
//   List<Object?> get props => [archive, currentNote];
// }
