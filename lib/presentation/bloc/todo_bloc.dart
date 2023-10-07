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
  ) : super(InitialState(_todoService.getNotes())) {
    on<LoadNotesEvent>((_, emit) {
      final newState = StartPageState(_todoService.getNotes());
      emit(newState);
    });

    on<SaveButtonPressed>((event, emit) async {
      await _todoService.addNote(event.noteName);
      final newState = StartPageState(_todoService.getNotes());
      emit(newState);
    });

    on<DeleteButtonPressed>((event, emit) async {
      await _todoService.deleteNote(event.indexToDelete);
      final newState = StartPageState(_todoService.getNotes());
      emit(newState);
    });

    on<UpdateNoteEvent>((event, emit) async {
      final isDone = _todoService.getNotes()[event.index].done;
      await _todoService.updateNote(
          event.index, event.name, event.text, isDone);
      final newState = NoteOpenedState(_todoService.getNotes(), event.index);
      emit(newState);
    });

    on<NoteClicked>((event, emit) {
      final newState = NoteOpenedState(_todoService.getNotes(), event.index);
      emit(newState);
    });

    on<ArchiveNoteClicked>((event, emit) {
      final newState =
          ArchiveNoteOpenedState(_todoService.getArchiveNotes(), event.index);
      emit(newState);
    });

    on<ArchiveNote>((event, emit) async {
      final note = _todoService.getNotes()[event.noteIndex];
      final name = note.name;
      final text = note.text;
      final done = note.done;
      await _todoService.archiveNote(event.noteIndex, name, text, done);
      final newState = StartPageState(_todoService.getNotes());
      emit(newState);
    });

    on<UnnarchiveNote>((event, emit) async {
      await _todoService.unarchiveNote(event.noteName, event.noteIndex);
      final newState = ArchiveState(_todoService.getArchiveNotes());
      emit(newState);
    });

    on<DeleteArchiveNote>((event, emit) async {
      await _todoService.deleteArchiveNote(event.indexToDelete);
      final newState = ArchiveState(_todoService.getArchiveNotes());
      emit(newState);
    });

    on<StartPageOpenEvent>((_, emit) {
      final newState = StartPageState(_todoService.getNotes());
      emit(newState);
    });

    on<ArchiveOpenEvent>((_, emit) {
      final newState = ArchiveState(_todoService.getArchiveNotes());
      emit(newState);
    });

    on<DoneButtonPressed>((event, emit) async {
      var note = _todoService.getNotes()[event.index];
      var name = note.name;
      var text = note.text;
      var isDone = note.done;

      await _todoService.updateNote(event.index, name, text, !isDone);
      await _todoService.archiveNote(event.index, name, text, !isDone);
      emit(StartPageState(_todoService.getNotes()));
    });
  }
}
