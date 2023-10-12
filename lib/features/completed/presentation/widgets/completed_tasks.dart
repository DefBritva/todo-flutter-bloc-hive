import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/presentation/bloc/todo_bloc.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({super.key});
  static void showNote(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/note');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is CompletedState) {
          return ListView.separated(
              itemBuilder: (context, index) {
                Note note = state.archiveNotes[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        flex: 1,
                        onPressed: (context) =>
                            BlocProvider.of<TodoBloc>(context)
                                .add(UnnarchiveNote(note.name, index)),
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                        label: 'uncomplete',
                      ),
                      SlidableAction(
                        onPressed: (context) =>
                            BlocProvider.of<TodoBloc>(context)
                                .add(DeleteCompletedNote(indexToDelete: index)),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
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
                      BlocProvider.of<TodoBloc>(context)
                          .add(CompletedNoteClicked(index));
                      showNote(context);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    height: UserSettings.height * 0.001,
                    color: Colors.black,
                  ),
              itemCount: state.archiveNotes.length);
        } else {
          return Container();
        }
      },
    );
  }
}
