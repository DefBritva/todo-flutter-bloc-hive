// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'start_bloc.dart';

sealed class StartState extends Equatable {
  final List<Note> notes;
  const StartState({required this.notes});
  @override
  List<Object?> get props => [notes];
  StartState copyWith({
    List<Note>? notes,
  }) {
    return StartPageState(notes: notes ?? this.notes);
  }

  StartState clone({List<Note>? notes}) => copyWith(notes: notes);
}

final class StartInitial extends StartState {
  const StartInitial({required super.notes});

  @override
  List<Object?> get props => [];
}

class RegisteringServiceState extends StartState {
  const RegisteringServiceState({required super.notes});

  @override
  List<Object?> get props => [];
}

class RegisterSuccessfulState extends StartState {
  const RegisterSuccessfulState({required super.notes});

  @override
  List<Object?> get props => [];
}

class RegisterErrorState extends StartState {
  final String error;
  const RegisterErrorState({
    required this.error,
    required super.notes,
  });
  @override
  List<Object?> get props => [error, notes];
}

class InitialState extends StartState {
  const InitialState({required super.notes});
}

class StartPageState extends StartState {
  const StartPageState({required super.notes});
}
