part of 'start_bloc.dart';

abstract class StartState extends Equatable {
  const StartState();
}

final class StartInitial extends StartState {
  @override
  List<Object?> get props => [];
}

class RegisteringServiceState extends StartState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccessfulState extends StartState {
  @override
  List<Object?> get props => [];
}

class RegisterErrorState extends StartState {
  final String error;
  const RegisterErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}

class InitialState extends StartState {
  final List<Note> notes;

  const InitialState(this.notes);

  @override
  List<Object?> get props => [notes];
}

class StartPageState extends StartState {
  final List<Note> notes;
  const StartPageState(this.notes);

  @override
  List<Object?> get props => [notes];
}
