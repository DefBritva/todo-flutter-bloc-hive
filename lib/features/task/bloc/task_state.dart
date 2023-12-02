part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  final int index;
  final Note task;
  const TaskState({
    required this.index,
    required this.task,
  });
  @override
  List<Object?> get props => [index, task];

  TaskState clone({int? index, Note? task});
}

class TaskOpenedState extends TaskState {
  const TaskOpenedState({
    required super.index,
    required super.task,
  });

  @override
  TaskOpenedState clone({int? index, Note? task}) {
    return TaskOpenedState(index: index ?? this.index, task: task ?? this.task);
  }
}

class FavoriteTaskOpenedState extends TaskState {
  const FavoriteTaskOpenedState({
    required super.index,
    required super.task,
  });

  @override
  FavoriteTaskOpenedState clone({int? index, Note? task}) {
    return FavoriteTaskOpenedState(
        index: index ?? this.index, task: task ?? this.task);
  }
}

class ArchiveTaskOpenedState extends TaskState {
  const ArchiveTaskOpenedState({
    required super.index,
    required super.task,
  });

  @override
  ArchiveTaskOpenedState clone({int? index, Note? task}) {
    return ArchiveTaskOpenedState(
        index: index ?? this.index, task: task ?? this.task);
  }
}

class CompletedTaskOpenedState extends TaskState {
  const CompletedTaskOpenedState({
    required super.index,
    required super.task,
  });

  @override
  CompletedTaskOpenedState clone({int? index, Note? task}) {
    return CompletedTaskOpenedState(
        index: index ?? this.index, task: task ?? this.task);
  }
}
