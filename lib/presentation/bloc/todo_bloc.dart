// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_todo_list/domain/entity/note.dart';
import 'package:my_todo_list/services/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoService _todoService;
  TodoBloc(
    this._todoService,
  ) : super(LoadedState(_todoService.getNotes())) {
    on<LoadNotesEvent>((event, emit) {
      emit(LoadedState(_todoService.getNotes()));
    });

    on<SaveButtonPressed>((event, emit) async {
      await _todoService.addNote(event.noteName);
      emit(LoadedState(_todoService.getNotes()));
    });

    on<DeleteButtonPressed>((event, emit) async {
      await _todoService.deleteNote(event.indexToDelete);
      emit(LoadedState(_todoService.getNotes()));
    });
  }
}
