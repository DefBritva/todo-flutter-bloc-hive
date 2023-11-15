import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/core/utils/navigation.dart';
import 'package:my_todo_list/features/start/bloc/start_bloc.dart';

class ArchiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ArchiveAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            context.read<StartBloc>().add(StartPageOpen());
            AppNavigation.showNotes(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          )),
      actions: const [MyIconButton()],
      backgroundColor: Colors.blueAccent,
      title: const Text(
        'Archive',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Scaffold.of(context).openEndDrawer(),
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
    );
  }
}
