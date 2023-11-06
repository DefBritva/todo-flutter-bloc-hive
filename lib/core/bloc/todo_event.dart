part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {}

final class RegisterService extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class LoadTasks extends TodoEvent {
  LoadTasks();
  @override
  List<Object?> get props => [];
}

final class SaveButtonPressed extends TodoEvent {
  final String taskName;
  SaveButtonPressed({required this.taskName});

  @override
  List<Object?> get props => [taskName];
}

final class DeleteButtonPressed extends TodoEvent {
  final int indexToDelete;
  DeleteButtonPressed({required this.indexToDelete});

  @override
  List<Object?> get props => [indexToDelete];
}

final class DeleteFavoritePressed extends TodoEvent {
  final int indexToDelete;
  DeleteFavoritePressed({required this.indexToDelete});

  @override
  List<Object?> get props => [indexToDelete];
}

final class UnfavoriteTask extends TodoEvent {
  final int noteIndex;

  UnfavoriteTask(this.noteIndex);

  @override
  List<Object?> get props => [noteIndex];
}

final class FavoriteTask extends TodoEvent {
  final int taskIndex;

  FavoriteTask(this.taskIndex);

  @override
  List<Object?> get props => [taskIndex];
}

final class CompleteTask extends TodoEvent {
  final int taskIndex;

  CompleteTask(this.taskIndex);
  @override
  List<Object?> get props => [taskIndex];
}

final class UncompleteTask extends TodoEvent {
  final String noteName;
  final int noteIndex;

  UncompleteTask(this.noteName, this.noteIndex);
  @override
  List<Object?> get props => [noteName, noteIndex];
}

final class CompleteFavoriteTask extends TodoEvent {
  final int taskIndex;

  CompleteFavoriteTask(this.taskIndex);

  @override
  List<Object?> get props => [taskIndex];
}

final class DeleteCompletedTask extends TodoEvent {
  final int indexToDelete;

  DeleteCompletedTask({required this.indexToDelete});

  @override
  List<Object?> get props => [indexToDelete];
}

final class TaskClicked extends TodoEvent {
  final int index;

  TaskClicked(this.index);
  @override
  List<Object?> get props => [index];
}

final class CompletedTaskClicked extends TodoEvent {
  final int index;

  CompletedTaskClicked(this.index);
  @override
  List<Object?> get props => [index];
}

final class UpdateTask extends TodoEvent {
  final int index;
  final String name;
  final String text;

  UpdateTask(this.index, this.name, this.text);
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

final class FavoritesOpen extends TodoEvent {
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

final class DoneFavoriteTask extends TodoEvent {
  final int index;

  DoneFavoriteTask(
    this.index,
  );

  @override
  List<Object?> get props => [index];
}

final class ArchiveOpen extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class ArchiveTask extends TodoEvent {
  final int index;

  ArchiveTask(this.index);

  @override
  List<Object?> get props => [index];
}

final class ArchiveFavoriteTask extends TodoEvent {
  final int index;

  ArchiveFavoriteTask(this.index);

  @override
  List<Object?> get props => [index];
}

final class ArchiveCompletedTask extends TodoEvent {
  final int index;

  ArchiveCompletedTask(this.index);

  @override
  List<Object?> get props => [index];
}

final class UnarchiveTask extends TodoEvent {
  final int index;

  UnarchiveTask(this.index);

  @override
  List<Object?> get props => [index];
}

final class DeleteArchiveTask extends TodoEvent {
  final int index;

  DeleteArchiveTask(this.index);

  @override
  List<Object?> get props => [index];
}

final class ArchiveTaskClicked extends TodoEvent {
  final int index;

  ArchiveTaskClicked(this.index);

  @override
  List<Object?> get props => [index];
}

final class DeleteAllArchiveTasks extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class DeleteAllTasks extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class DeleteAllFavoritesTasks extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class DeleteAllCompletedTasks extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class AddFavoriteTask extends TodoEvent {
  final int index;

  AddFavoriteTask(this.index);

  @override
  List<Object?> get props => [index];
}

final class FavoriteTaskClicked extends TodoEvent {
  final int index;

  FavoriteTaskClicked(this.index);

  @override
  List<Object?> get props => [index];
}

final class UpdateFavoriteTask extends TodoEvent {
  final int index;
  final String name;
  final String text;

  UpdateFavoriteTask(this.index, this.name, this.text);
  @override
  List<Object?> get props => [index, name, text];
}
