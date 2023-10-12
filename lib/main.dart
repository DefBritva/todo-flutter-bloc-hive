import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_todo_list/core/domain/todo_service/todo.dart';
import 'package:my_todo_list/core/presentation/bloc/my_bloc_observer.dart';
import 'package:my_todo_list/core/presentation/bloc/todo_bloc.dart';
import 'package:my_todo_list/features/archive_page/presentation/widgets/archive.dart';
import 'package:my_todo_list/features/form_page/presentation/widgets/form_page.dart';
import 'package:my_todo_list/features/note_page.dart/presentation/note.dart';
import 'package:path_provider/path_provider.dart';

import 'features/start_page.dart/presentation/widgets/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.initFlutter('hive_db');
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
          TodoBloc(RepositoryProvider.of(context))..add(RegisterService()),
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
