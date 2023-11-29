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
}

final class TaskInitial extends TaskState {
  const TaskInitial({
    required super.index,
    required super.task,
  });
}

class TaskOpenedState extends TaskState {
  const TaskOpenedState({
    required super.index,
    required super.task,
  });
}

class FavoriteTaskOpenedState extends TaskState {
  const FavoriteTaskOpenedState({
    required super.index,
    required super.task,
  });
}

class ArchiveNoteOpenedState extends TaskState {
  const ArchiveNoteOpenedState({
    required super.index,
    required super.task,
  });
}

class CompletedNoteOpenedState extends TaskState {
  const CompletedNoteOpenedState({
    required super.index,
    required super.task,
  });
}
