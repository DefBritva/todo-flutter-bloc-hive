import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/core/bloc/todo_bloc.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';

class FavoritesMenuDrawer extends StatelessWidget {
  const FavoritesMenuDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: UserSettings.height * 0.66),
      child: SizedBox(
        height: UserSettings.height * 0.12,
        width: UserSettings.width * 0.45,
        child: Drawer(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                TextButton(
                  onPressed: () =>
                      context.read<TodoBloc>().add(DeleteAllFavoritesTasks()),
                  child: const Text('remove all favorites'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
