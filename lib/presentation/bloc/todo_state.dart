// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  final List<Note> notes;
  const TodoState(this.notes);
}

class LoadedState extends TodoState {
  const LoadedState(super.notes);

  @override
  List<Object?> get props => [notes];
}
