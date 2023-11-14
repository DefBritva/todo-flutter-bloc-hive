// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_todo_list/core/domain/entity/note.dart';
// import 'package:my_todo_list/core/domain/todo_service/todo.dart';

// part 'todo_event.dart';
// part 'todo_state.dart';

// class TodoBloc extends Bloc<TodoEvent, TodoState1> {
//   final TodoService _todoService;
//   TodoBloc(
//     this._todoService,
//   ) : super(RegisteringServiceState1()) {
//     on<UpdateTaskk>((event, emit) async {
//       final isDone = _todoService.getTasks()[event.index].done;
//       await _todoService.updateNote(
//           event.index, event.name, event.text, isDone);
//       final newState = NoteOpenedState1(_todoService.getTasks(), event.index);
//       emit(newState);
//     });

//     on<TaskClickedd>((event, emit) {
//       final newState = NoteOpenedState1(_todoService.getTasks(), event.index);
//       emit(newState);
//     });

//     on<CompletedTaskClickedd>((event, emit) {
//       final newState = CompletedNoteOpenedState1(
//           _todoService.getCompletedTasks(), event.index);
//       emit(newState);
//     });

//     on<UncompleteTaskk>((event, emit) async {
//       await _todoService.uncompleteTask(event.noteName, event.noteIndex);
//       final newState = CompletedState1(_todoService.getCompletedTasks());
//       emit(newState);
//     });

//     on<CompleteFavoriteTaskk>((event, emit) async {
//       final task = _todoService.getFavoritesTasks()[event.taskIndex];
//       final name = task.name;
//       final text = task.text;
//       final done = task.done;
//       final completedTask = Note(name: name, text: text, done: !done);
//       await _todoService.completeFavoriteTask(event.taskIndex, completedTask);
//       final newState = FavoritesState1(_todoService.getFavoritesTasks());
//       emit(newState);
//     });

//     on<DeleteCompletedTaskk>((event, emit) async {
//       await _todoService.deleteCompletedTask(event.indexToDelete);
//       final newState = CompletedState1(_todoService.getCompletedTasks());
//       emit(newState);
//     });

//     on<StartPageOpenn>((_, emit) {
//       final newState = StartPageStateeeeee(_todoService.getTasks());
//       emit(newState);
//     });

//     on<CompletedOpenn>((_, emit) {
//       final newState = CompletedState1(_todoService.getCompletedTasks());
//       emit(newState);
//     });

//     on<UnfavoriteTaskk>((event, emit) async {
//       final note = _todoService.getFavoritesTasks()[event.noteIndex];
//       await _todoService.unfavoriteTask(note.name, event.noteIndex);
//       final newState = FavoritesState1(_todoService.getFavoritesTasks());
//       emit(newState);
//     });

//     on<DeleteFavoritePressedd>((event, emit) async {
//       await _todoService.deleteFavoriteTask(event.indexToDelete);
//       final newState = FavoritesState1(_todoService.getFavoritesTasks());
//       emit(newState);
//     });

//     on<DoneFavoriteTaskk>((event, emit) async {
//       var note = _todoService.getFavoritesTasks()[event.index];
//       var name = note.name;
//       var text = note.text;
//       var isDone = note.done;
//       await _todoService.completeTask(event.index, name, text, !isDone);
//       emit(FavoritesState1(_todoService.getFavoritesTasks()));
//     });

//     on<FavoritesOpenn>((event, emit) {
//       final newState = FavoritesState1(_todoService.getFavoritesTasks());
//       emit(newState);
//     });

//     on<AddFavoriteTaskk>((event, emit) async {
//       final note = _todoService.getTasks()[event.index];
//       final name = note.name;
//       final text = note.text;
//       await _todoService.addFavoriteTask(name, text);
//       await _todoService.deleteTask(event.index);
//       final newState = StartPageStateeeeee(_todoService.getTasks());
//       emit(newState);
//     });

//     on<ArchiveOpenn>((event, emit) {
//       final newState = ArchiveState1(_todoService.getArchiveTasks());
//       emit(newState);
//     });

//     on<UnarchiveTaskk>((event, emit) async {
//       final note = _todoService.getArchiveTasks()[event.index];
//       if (note.done) {
//         await _todoService.unarchiveCompletedTask(event.index);
//         final newState = ArchiveState1(_todoService.getArchiveTasks());
//         emit(newState);
//       } else {
//         await _todoService.unarchiveTask(event.index);
//         final newState = ArchiveState1(_todoService.getArchiveTasks());
//         emit(newState);
//       }
//     });

//     on<ArchiveFavoriteTaskk>((event, emit) async {
//       await _todoService.archiveFavoriteTask(event.index);
//       final newState = FavoritesState1(_todoService.getFavoritesTasks());
//       emit(newState);
//     });

//     on<ArchiveCompletedTaskk>((event, emit) async {
//       await _todoService.archiveCompletedTask(event.index);
//       final newState = CompletedState1(_todoService.getCompletedTasks());
//       emit(newState);
//     });

//     on<ArchiveTaskClickedd>((event, emit) {
//       final newState =
//           ArchiveNoteOpenedState1(_todoService.getArchiveTasks(), event.index);
//       emit(newState);
//     });

//     on<DeleteArchiveTaskk>((event, emit) async {
//       await _todoService.deleteArchiveTask(event.index);
//       final newState = ArchiveState1(_todoService.getArchiveTasks());
//       emit(newState);
//     });

//     on<DeleteAllArchiveTaskss>((event, emit) async {
//       await _todoService.deleteAllArchiveTasks();
//       final newState = ArchiveState1(_todoService.getArchiveTasks());
//       emit(newState);
//     });

//     on<DeleteAllFavoritesTaskss>((event, emit) async {
//       await _todoService.deleteAllFavoritesTasks();
//       final newState = FavoritesState1(_todoService.getFavoritesTasks());
//       emit(newState);
//     });

//     on<DeleteAllCompletedTaskss>((event, emit) async {
//       await _todoService.deleteAllCompletedTasks();
//       final newState = CompletedState1(_todoService.getCompletedTasks());
//       emit(newState);
//     });

//     on<FavoriteTaskClickedd>((event, emit) {
//       final newState = FavoriteNoteOpenedState1(
//           _todoService.getFavoritesTasks(), event.index);
//       emit(newState);
//     });

//     on<UpdateFavoriteTaskk>((event, emit) async {
//       final isDone = _todoService.getFavoritesTasks()[event.index].done;
//       await _todoService.updateFavoriteTask(
//           event.index, event.name, event.text, isDone);
//       final newState = FavoriteNoteOpenedState1(
//           _todoService.getFavoritesTasks(), event.index);
//       emit(newState);
//     });
//   }
// }
