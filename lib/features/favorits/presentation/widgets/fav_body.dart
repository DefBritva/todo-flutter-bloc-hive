import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/bloc/todo_bloc.dart';
import 'package:my_todo_list/core/utils/navigation.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';

class FavoritsBody extends StatelessWidget {
  const FavoritsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is FavoritesState) {
          return SizedBox(
            height: UserSettings.height * 0.79,
            width: double.infinity,
            child: ListView.separated(
              itemBuilder: (context, index) {
                Note note = state.favorits[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        flex: 1,
                        onPressed: (context) => context
                            .read<TodoBloc>()
                            .add(ArchiveFavoriteTask(index)),
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                      ),
                      SlidableAction(
                        onPressed: (context) =>
                            BlocProvider.of<TodoBloc>(context).add(
                                DeleteFavoritePressed(indexToDelete: index)),
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
                            .add(CompleteFavoriteTask(index));
                      },
                    ),
                    title: Text(note.name),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      BlocProvider.of<TodoBloc>(context)
                          .add(FavoriteTaskClicked(index));
                      AppNavigation.showNote(context);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: UserSettings.height * 0.001,
                color: Colors.black,
              ),
              itemCount: state.favorits.length,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
