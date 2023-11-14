import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/bloc/todo_bloc.dart';
import 'package:my_todo_list/core/utils/navigation.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';

class StartBody extends StatelessWidget {
  const StartBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: _GroupsList(),
    );
  }
}

class _GroupsList extends StatelessWidget {
  const _GroupsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is StartPageState) {
          return SizedBox(
            height: UserSettings.height * 0.79,
            width: double.infinity,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  Note note = state.notes[index];
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          flex: 1,
                          onPressed: (context) {
                            context
                                .read<TodoBloc>()
                                .add(AddFavoriteTask(index));
                          },
                          backgroundColor: Colors.yellow,
                          foregroundColor: Colors.white,
                          icon: Icons.star,
                        ),
                        SlidableAction(
                          flex: 1,
                          onPressed: (context) =>
                              BlocProvider.of<TodoBloc>(context)
                                  .add(ArchiveTask(index)),
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          icon: Icons.archive,
                        ),
                        SlidableAction(
                          onPressed: (context) =>
                              BlocProvider.of<TodoBloc>(context).add(
                                  DeleteButtonPressed(indexToDelete: index)),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Checkbox(
                        value: note.done,
                        onChanged: (value) {
                          context
                              .read<TodoBloc>()
                              .add(DoneButtonPressed(index));
                        },
                      ),
                      title: Text(note.name),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        BlocProvider.of<TodoBloc>(context)
                            .add(TaskClicked(index));
                        AppNavigation.showNote(context);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      height: UserSettings.height * 0.001,
                      color: Colors.black,
                    ),
                itemCount: state.notes.length),
          );
        } else {
          return Container();
        }
      },
    );
  }
}