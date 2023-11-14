import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_todo_list/core/domain/todo_service/todo.dart';
import 'package:my_todo_list/core//bloc/my_bloc_observer.dart';
import 'package:my_todo_list/core/bloc/todo_bloc.dart';
import 'package:my_todo_list/features/archive/archive_page.dart';
import 'package:my_todo_list/features/completed/presentation/completed_page.dart';
import 'package:my_todo_list/features/favorits/presentation/favorits_page.dart';
import 'package:my_todo_list/features/form/presentation/form_page.dart';
import 'package:my_todo_list/features/start/bloc/start_bloc.dart';
import 'package:my_todo_list/features/task/bloc/task_bloc.dart';
import 'package:my_todo_list/features/task/presentation/task_page.dart';
import 'package:path_provider/path_provider.dart';

import 'features/start/presentation/start_page.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              StartBloc(RepositoryProvider.of(context))..add(RegisterService()),
        ),
        BlocProvider(
          create: (context) => TaskBloc(RepositoryProvider.of(context)),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/groups': (context) => const StartPage(),
          '/groups/form': (context) => const FormPage(),
          '/groups/note': (context) => const TaskPage(),
          // '/groups/completed': (context) => const CompletedPage(),
          // '/groups/favorites': (context) => const FavoritsPage(),
          // '/groups/archive': (context) => const ArchivePage()
        },
        initialRoute: '/groups',
      ),
    );
  }
}
