import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/core/presentation/bloc/todo_bloc.dart';

class StartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StartAppBar({
    super.key,
  });

  static void showArchive(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/groups/archive');
    context.read<TodoBloc>().add(CompletedOpen());
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.star,
            color: Colors.white,
          )),
      actions: [
        IconButton(
            onPressed: () => showArchive(context),
            icon: const Icon(
              Icons.done,
              color: Colors.white,
            )),
        const MyIconButton()
      ],
      backgroundColor: Colors.blueAccent,
      title: const Text(
        "Tasks",
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
