part of 'completed_bloc.dart';

sealed class CompletedState extends Equatable {
  final List<Note> completedTasks;
  const CompletedState({required this.completedTasks});
  @override
  List<Object?> get props => [completedTasks];
  CompletedState clone({List<Note>? completedTasks});
}

class CompletedPageState extends CompletedState {
  const CompletedPageState({required super.completedTasks});

  @override
  CompletedPageState clone({
    List<Note>? completedTasks,
  }) {
    return CompletedPageState(
        completedTasks: completedTasks ?? this.completedTasks);
  }
}
