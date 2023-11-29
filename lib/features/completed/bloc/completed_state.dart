part of 'completed_bloc.dart';

sealed class CompletedState extends Equatable {
  final List<Note> completedTasks;
  const CompletedState({required this.completedTasks});
  @override
  List<Object?> get props => [completedTasks];
}

final class CompletedInitial extends CompletedState {
  const CompletedInitial({required super.completedTasks});
}

class CompletedPageState extends CompletedState {
  const CompletedPageState({required super.completedTasks});
}
