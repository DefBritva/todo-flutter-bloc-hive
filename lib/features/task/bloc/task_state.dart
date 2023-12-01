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

class ArchiveNoteOpenedState extends TaskState {
  const ArchiveNoteOpenedState({
    required super.index,
    required super.task,
  });

  @override
  ArchiveNoteOpenedState clone({int? index, Note? task}) {
    return ArchiveNoteOpenedState(
        index: index ?? this.index, task: task ?? this.task);
  }
}

class CompletedNoteOpenedState extends TaskState {
  const CompletedNoteOpenedState({
    required super.index,
    required super.task,
  });

  @override
  CompletedNoteOpenedState clone({int? index, Note? task}) {
    return CompletedNoteOpenedState(
        index: index ?? this.index, task: task ?? this.task);
  }
}
