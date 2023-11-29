import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/core/utils/navigation.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';
import 'package:my_todo_list/features/archive/bloc/archive_bloc.dart';
import 'package:my_todo_list/features/completed/bloc/completed_bloc.dart';
import 'package:my_todo_list/features/favorits/bloc/favorits_bloc.dart';
import 'package:my_todo_list/features/start/bloc/start_bloc.dart';
import 'package:my_todo_list/features/task/bloc/task_bloc.dart';

class TaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaskAppBar({
    super.key,
    required this.name,
    required this.textfieldFocusNode,
    required this.noteController,
  });

  final String name;
  final FocusNode textfieldFocusNode;
  final TextEditingController noteController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return BackButton(
            onPressed: () {
              if (state is TaskOpenedState) {
                context.read<StartBloc>().add(StartPageOpen());
                AppNavigation.back(context);
              } else if (state is FavoriteTaskOpenedState) {
                context.read<FavoritesBloc>().add(FavoritesOpen());
                AppNavigation.back(context);
              } else if (state is ArchiveNoteOpenedState) {
                context.read<ArchiveBloc>().add(ArchiveOpen());
                AppNavigation.back(context);
              } else if (state is CompletedNoteOpenedState) {
                context.read<CompletedBloc>().add(CompletedOpen());
                AppNavigation.back(context);
              }
            },
            color: Colors.white,
          );
        },
      ),
      backgroundColor: Colors.blueAccent,
      actions: [
        SizedBox(
          width: UserSettings.width * 0.21,
        ),
        SizedBox(
          width: UserSettings.width * 0.55,
          child: FittedBox(
            fit: BoxFit.contain,
            child: AutoSizeText(
              maxLines: 1,
              name,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            debugPrint('${UserSettings.height}');
            debugPrint('${UserSettings.width}');
          },
          icon: const Icon(
            Icons.pending,
            color: Colors.white,
          ),
        ),
        textfieldFocusNode.hasFocus
            ? IconButton(
                onPressed: () {
                  final state = context.read<TaskBloc>().state;
                  if (state is TaskOpenedState) {
                    final index = state.index;
                    final task = state.task.clone(text: noteController.text);
                    BlocProvider.of<TaskBloc>(context)
                        .add(UpdateTask(index: index, task: task));
                    FocusScope.of(context).unfocus();
                  } else if (state is FavoriteTaskOpenedState) {
                    final index = state.index;
                    final task = state.task.clone(text: noteController.text);
                    context
                        .read<TaskBloc>()
                        .add(UpdateFavoriteTask(index: index, task: task));
                    FocusScope.of(context).unfocus();
                  }
                },
                icon: const Icon(Icons.done),
                color: Colors.white,
              )
            : Container()
      ],
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
