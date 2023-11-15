part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();
}

final class UpdateTask extends TaskEvent {
  final int index;
  final String name;
  final String text;

  const UpdateTask(this.index, this.name, this.text);
  @override
  List<Object?> get props => [index, name, text];
}

final class TaskOpen extends TaskEvent {
  final int index;
  final Note note;

  const TaskOpen({required this.index, required this.note});
  @override
  List<Object?> get props => [index, note];
}

final class FavoriteTaskOpen extends TaskEvent {
  final int index;
  final Note note;

  const FavoriteTaskOpen({required this.index, required this.note});

  @override
  List<Object?> get props => [index, note];
}

final class UpdateFavoriteTask extends TaskEvent {
  final int index;
  final String name;
  final String text;

  const UpdateFavoriteTask(this.index, this.name, this.text);
  @override
  List<Object?> get props => [index, name, text];
}

final class ArchiveTaskOpen extends TaskEvent {
  final int index;
  final Note note;

  const ArchiveTaskOpen(this.index, this.note);

  @override
  List<Object?> get props => [index, note];
}

final class CompletedTaskOpen extends TaskEvent {
  final int index;
  final Note note;

  const CompletedTaskOpen(this.index, this.note);
  @override
  List<Object?> get props => [index, note];
}
