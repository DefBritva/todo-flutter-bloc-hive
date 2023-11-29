import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/utils/navigation.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';
import 'package:my_todo_list/features/completed/bloc/completed_bloc.dart';
import 'package:my_todo_list/features/task/bloc/task_bloc.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({super.key});
  static void showNote(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/note');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletedBloc, CompletedState>(
      builder: (context, state) {
        if (state is CompletedPageState) {
          return ListView.separated(
              itemBuilder: (context, index) {
                Note note = state.completedTasks[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        flex: 1,
                        onPressed: (context) => context
                            .read<CompletedBloc>()
                            .add(ArchiveCompletedTask(index)),
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                      ),
                      SlidableAction(
                        onPressed: (context) =>
                            BlocProvider.of<CompletedBloc>(context)
                                .add(DeleteCompletedTask(indexToDelete: index)),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      value: note.done,
                      onChanged: (_) {},
                    ),
                    title: Text(note.name),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      final task = state.completedTasks[index];
                      context
                          .read<TaskBloc>()
                          .add(CompletedTaskOpen(index: index, task: task));
                      AppNavigation.showNote(context);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    height: UserSettings.height * 0.001,
                    color: Colors.black,
                  ),
              itemCount: state.completedTasks.length);
        } else {
          return Container();
        }
      },
    );
  }
}
