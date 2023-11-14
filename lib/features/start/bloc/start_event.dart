part of 'start_bloc.dart';

sealed class StartEvent extends Equatable {
  const StartEvent();
}

final class RegisterService extends StartEvent {
  @override
  List<Object?> get props => [];
}

final class LoadTasks extends StartEvent {
  const LoadTasks();

  @override
  List<Object?> get props => [];
}

final class SaveButtonPressed extends StartEvent {
  final String taskName;
  const SaveButtonPressed({required this.taskName});

  @override
  List<Object?> get props => [taskName];
}

final class DeleteButtonPressed extends StartEvent {
  final int indexToDelete;
  const DeleteButtonPressed({required this.indexToDelete});

  @override
  List<Object?> get props => [indexToDelete];
}

final class DoneButtonPressed extends StartEvent {
  final int index;

  const DoneButtonPressed(
    this.index,
  );

  @override
  List<Object?> get props => [index];
}

final class AddFavoriteTask extends StartEvent {
  final int index;

  const AddFavoriteTask(this.index);

  @override
  List<Object?> get props => [index];
}

final class ArchiveTask extends StartEvent {
  final int index;

  const ArchiveTask(this.index);

  @override
  List<Object?> get props => [index];
}

final class DeleteAllTasks extends StartEvent {
  @override
  List<Object?> get props => [];
}

final class CompleteTask extends StartEvent {
  final int taskIndex;

  const CompleteTask(this.taskIndex);
  @override
  List<Object?> get props => [taskIndex];
}

final class StartPageOpen extends StartEvent {
  @override
  List<Object?> get props => [];
}
