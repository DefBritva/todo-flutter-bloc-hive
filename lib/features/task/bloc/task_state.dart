part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  final int index;
  final Note note;
  const TaskState({
    required this.index,
    required this.note,
  });
  @override
  List<Object?> get props => [index, note];
}

final class TaskInitial extends TaskState {
  const TaskInitial({
    required super.index,
    required super.note,
  });
}

class TaskOpenedState extends TaskState {
  const TaskOpenedState({
    required super.index,
    required super.note,
  });
}

class FavoriteTaskOpenedState extends TaskState {
  const FavoriteTaskOpenedState({
    required super.index,
    required super.note,
  });
}

class ArchiveNoteOpenedState extends TaskState {
  const ArchiveNoteOpenedState({
    required super.index,
    required super.note,
  });
}

class CompletedNoteOpenedState extends TaskState {
  const CompletedNoteOpenedState({
    required super.index,
    required super.note,
  });
}
