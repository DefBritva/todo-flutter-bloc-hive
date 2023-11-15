import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';
import 'package:my_todo_list/features/archive/bloc/archive_bloc.dart';

class ArchiveMenuDrawer extends StatelessWidget {
  const ArchiveMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding:
            EdgeInsets.only(top: Scaffold.of(context).appBarMaxHeight ?? 0),
        child: SizedBox(
          height: 100,
          width: UserSettings.width * 0.45,
          child: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              children: [
                TextButton(
                  onPressed: () =>
                      context.read<ArchiveBloc>().add(DeleteAllArchiveTasks()),
                  child: const Text('remove all archive'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
