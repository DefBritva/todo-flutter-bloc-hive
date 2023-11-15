part of 'completed_bloc.dart';

sealed class CompletedState extends Equatable {
  const CompletedState();
}

final class CompletedInitial extends CompletedState {
  @override
  List<Object?> get props => [];
}

class CompletedPageState extends CompletedState {
  final List<Note> completedNotes;

  const CompletedPageState(this.completedNotes);

  @override
  List<Object?> get props => [completedNotes];
}
