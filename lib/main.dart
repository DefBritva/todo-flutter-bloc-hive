import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_todo_list/domain/entity/note.dart';
import 'package:my_todo_list/presentation/bloc/my_bloc_observer.dart';
import 'package:my_todo_list/presentation/bloc/todo_bloc.dart';
import 'package:my_todo_list/presentation/ui/pages/archive_page/archive.dart';
import 'package:my_todo_list/presentation/ui/pages/form_page/form_page.dart';
import 'package:my_todo_list/presentation/ui/pages/note_page.dart/note.dart';
import 'package:my_todo_list/services/todo.dart';

import 'presentation/ui/pages/start_page.dart/start_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  notesBox = await Hive.openBox<Note>('notes');
  archiveNotesBox = await Hive.openBox<Note>('archiveNotes');
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TodoService(),
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TodoBloc(RepositoryProvider.of(context))..add(LoadNotesEvent()),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        routes: {
          '/groups': (context) => const StartPage(),
          '/groups/form': (context) => const FormWidget(),
          '/groups/note': (context) => const NoteWidget(),
          '/groups/archive': (context) => const Archive(),
        },
        initialRoute: '/groups',
      ),
    );
  }
}
