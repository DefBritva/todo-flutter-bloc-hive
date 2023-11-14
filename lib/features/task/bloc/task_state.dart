part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();
}

final class TaskInitial extends TaskState {
  @override
  List<Object?> get props => [];
}

class TaskOpenedState extends TaskState {
  final int index;
  final Note note;

  const TaskOpenedState({required this.note, required this.index});

  @override
  List<Object?> get props => [note, index];
}
