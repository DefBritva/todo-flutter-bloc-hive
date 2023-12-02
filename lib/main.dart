import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_todo_list/core/domain/services/archive_task_service.dart';
import 'package:my_todo_list/core/domain/services/completed_task_service.dart';
import 'package:my_todo_list/core/domain/services/favorites_task_service.dart';
import 'package:my_todo_list/core/domain/services/task_service.dart';
import 'package:my_todo_list/core/domain/services/box_service.dart';
import 'package:my_todo_list/features/archive/archive_page.dart';
import 'package:my_todo_list/features/archive/bloc/archive_bloc.dart';
import 'package:my_todo_list/features/completed/bloc/completed_bloc.dart';
import 'package:my_todo_list/features/completed/presentation/completed_page.dart';
import 'package:my_todo_list/features/favorits/bloc/favorits_bloc.dart';
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
  // Инициализируем Hive и передаём в Bloc наш observer для отслеживания
  // состояний и событий
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Виджет MultiRepositoryProvider внедряет наши Services в дерево виджетов
    // для последующей передачи их в BLoC, так как BLoC использует в себе сервисы
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => BoxService(),
        ),
        RepositoryProvider(
          create: (context) => TasksService(),
        ),
        RepositoryProvider(
          create: (context) => CompletedTasksService(),
        ),
        RepositoryProvider(
          create: (context) => FavoritesTasksService(),
        ),
        RepositoryProvider(
          create: (context) => ArchiveTasksService(),
        ),
      ],
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
    // Внедряем в дерево виджетов блоки, для последующего доступа к блокам из
    // виджетов ниже по дереву виджетов
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StartBloc(
              RepositoryProvider.of<TasksService>(context),
              RepositoryProvider.of<BoxService>(context))
            ..add(InitServices()),
        ),
        BlocProvider(
          create: (context) => TaskBloc(
              RepositoryProvider.of<TasksService>(context),
              RepositoryProvider.of<FavoritesTasksService>(context)),
        ),
        BlocProvider(
          create: (context) => FavoritesBloc(
              RepositoryProvider.of<FavoritesTasksService>(context)),
        ),
        BlocProvider(
          create: ((context) =>
              ArchiveBloc(RepositoryProvider.of<ArchiveTasksService>(context))),
        ),
        BlocProvider(
          create: ((context) => CompletedBloc(
              RepositoryProvider.of<CompletedTasksService>(context))),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        // все страницы приложения
        routes: {
          '/groups': (context) => const StartPage(),
          '/groups/form': (context) => const FormPage(),
          '/groups/note': (context) => const TaskPage(),
          '/groups/completed': (context) => const CompletedPage(),
          '/groups/favorites': (context) => const FavoritsPage(),
          '/groups/archive': (context) => const ArchivePage()
        },
        initialRoute: '/groups',
      ),
    );
  }
}

//observer для отслеживания состояний и событий
class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('${bloc.runtimeType} $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('$error');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('$change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('$transition');
  }
}
