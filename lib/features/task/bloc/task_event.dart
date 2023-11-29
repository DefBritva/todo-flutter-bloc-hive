part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  final int index;
  final Note task;
  const TaskEvent({required this.index, required this.task});
  @override
  List<Object?> get props => [index, task];
}

final class UpdateTask extends TaskEvent {
  const UpdateTask({required super.index, required super.task});
}

final class TaskOpen extends TaskEvent {
  const TaskOpen({required super.index, required super.task});
}

final class FavoriteTaskOpen extends TaskEvent {
  const FavoriteTaskOpen({required super.index, required super.task});
}

final class UpdateFavoriteTask extends TaskEvent {
  const UpdateFavoriteTask({required super.index, required super.task});
}

final class ArchiveTaskOpen extends TaskEvent {
  const ArchiveTaskOpen({required super.index, required super.task});
}

final class CompletedTaskOpen extends TaskEvent {
  const CompletedTaskOpen({required super.index, required super.task});
}
