// part of 'todo_bloc.dart';

// sealed class TodoEvent extends Equatable {}

// final class DeleteFavoritePressedd extends TodoEvent {
//   final int indexToDelete;
//   DeleteFavoritePressedd({required this.indexToDelete});

//   @override
//   List<Object?> get props => [indexToDelete];
// }

// final class UnfavoriteTaskk extends TodoEvent {
//   final int noteIndex;

//   UnfavoriteTaskk(this.noteIndex);

//   @override
//   List<Object?> get props => [noteIndex];
// }

// final class UncompleteTaskk extends TodoEvent {
//   final String noteName;
//   final int noteIndex;

//   UncompleteTaskk(this.noteName, this.noteIndex);
//   @override
//   List<Object?> get props => [noteName, noteIndex];
// }

// final class CompleteFavoriteTaskk extends TodoEvent {
//   final int taskIndex;

//   CompleteFavoriteTaskk(this.taskIndex);

//   @override
//   List<Object?> get props => [taskIndex];
// }

// final class DeleteCompletedTaskk extends TodoEvent {
//   final int indexToDelete;

//   DeleteCompletedTaskk({required this.indexToDelete});

//   @override
//   List<Object?> get props => [indexToDelete];
// }

// final class TaskClickedd extends TodoEvent {
//   final int index;

//   TaskClickedd(this.index);
//   @override
//   List<Object?> get props => [index];
// }

// final class CompletedTaskClickedd extends TodoEvent {
//   final int index;

//   CompletedTaskClickedd(this.index);
//   @override
//   List<Object?> get props => [index];
// }

// final class UpdateTaskk extends TodoEvent {
//   final int index;
//   final String name;
//   final String text;

//   UpdateTaskk(this.index, this.name, this.text);
//   @override
//   List<Object?> get props => [index, name, text];
// }

// final class CompletedOpenn extends TodoEvent {
//   @override
//   List<Object?> get props => [];
// }

// final class StartPageOpenn extends TodoEvent {
//   @override
//   List<Object?> get props => [];
// }

// final class FavoritesOpenn extends TodoEvent {
//   @override
//   List<Object?> get props => [];
// }

// final class DoneFavoriteTaskk extends TodoEvent {
//   final int index;

//   DoneFavoriteTaskk(
//     this.index,
//   );

//   @override
//   List<Object?> get props => [index];
// }

// final class ArchiveOpenn extends TodoEvent {
//   @override
//   List<Object?> get props => [];
// }

// final class ArchiveFavoriteTaskk extends TodoEvent {
//   final int index;

//   ArchiveFavoriteTaskk(this.index);

//   @override
//   List<Object?> get props => [index];
// }

// final class ArchiveCompletedTaskk extends TodoEvent {
//   final int index;

//   ArchiveCompletedTaskk(this.index);

//   @override
//   List<Object?> get props => [index];
// }

// final class UnarchiveTaskk extends TodoEvent {
//   final int index;

//   UnarchiveTaskk(this.index);

//   @override
//   List<Object?> get props => [index];
// }

// final class DeleteArchiveTaskk extends TodoEvent {
//   final int index;

//   DeleteArchiveTaskk(this.index);

//   @override
//   List<Object?> get props => [index];
// }

// final class ArchiveTaskClickedd extends TodoEvent {
//   final int index;

//   ArchiveTaskClickedd(this.index);

//   @override
//   List<Object?> get props => [index];
// }

// final class DeleteAllArchiveTaskss extends TodoEvent {
//   @override
//   List<Object?> get props => [];
// }

// final class DeleteAllFavoritesTaskss extends TodoEvent {
//   @override
//   List<Object?> get props => [];
// }

// final class DeleteAllCompletedTaskss extends TodoEvent {
//   @override
//   List<Object?> get props => [];
// }

// final class AddFavoriteTaskk extends TodoEvent {
//   final int index;

//   AddFavoriteTaskk(this.index);

//   @override
//   List<Object?> get props => [index];
// }

// final class FavoriteTaskClickedd extends TodoEvent {
//   final int index;

//   FavoriteTaskClickedd(this.index);

//   @override
//   List<Object?> get props => [index];
// }

// final class UpdateFavoriteTaskk extends TodoEvent {
//   final int index;
//   final String name;
//   final String text;

//   UpdateFavoriteTaskk(this.index, this.name, this.text);
//   @override
//   List<Object?> get props => [index, name, text];
// }
