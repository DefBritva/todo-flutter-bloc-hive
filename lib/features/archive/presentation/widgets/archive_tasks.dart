import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';
import 'package:my_todo_list/features/archive/bloc/archive_bloc.dart';
import 'package:my_todo_list/features/task/bloc/task_bloc.dart';

class ArchiveTasks extends StatelessWidget {
  const ArchiveTasks({super.key});
  static void showNote(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/note');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArchiveBloc, ArchiveState>(
      builder: (context, state) {
        if (state is ArchivePageState) {
          return ListView.separated(
              itemBuilder: (context, index) {
                Note note = state.archive[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        flex: 1,
                        onPressed: (context) => context
                            .read<ArchiveBloc>()
                            .add(UnarchiveTask(index)),
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                      ),
                      SlidableAction(
                        onPressed: (context) => context
                            .read<ArchiveBloc>()
                            .add(DeleteArchiveTask(index)),
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
                      final task = state.archive[index];
                      BlocProvider.of<TaskBloc>(context)
                          .add(ArchiveTaskOpen(index: index, task: task));
                      showNote(context);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    height: UserSettings.height * 0.001,
                    color: Colors.black,
                  ),
              itemCount: state.archive.length);
        } else {
          return Container();
        }
      },
    );
  }
}
