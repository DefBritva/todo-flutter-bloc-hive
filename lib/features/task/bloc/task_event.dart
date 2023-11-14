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
