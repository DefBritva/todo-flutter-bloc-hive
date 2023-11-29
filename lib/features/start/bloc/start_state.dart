// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'start_bloc.dart';

sealed class StartState extends Equatable {
  final List<Note> tasks;
  const StartState({required this.tasks});
  @override
  List<Object?> get props => [tasks];
  StartState clone({
    List<Note>? tasks,
  }) {
    return StartPageState(tasks: tasks ?? this.tasks);
  }
}

class RegisteringServiceState extends StartState {
  const RegisteringServiceState({required super.tasks});
}

class RegisterSuccessfulState extends StartState {
  const RegisterSuccessfulState({required super.tasks});
}

class RegisterErrorState extends StartState {
  final String error;
  const RegisterErrorState({
    required this.error,
    required super.tasks,
  });
  @override
  List<Object?> get props => [error, tasks];
}

class InitialState extends StartState {
  const InitialState({required super.tasks});
}

class StartPageState extends StartState {
  const StartPageState({required super.tasks});
}
