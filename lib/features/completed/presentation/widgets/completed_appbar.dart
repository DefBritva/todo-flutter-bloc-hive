import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/core/presentation/bloc/todo_bloc.dart';

class CompletedAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CompletedAppbar({super.key});

  static void back(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/groups');
    context.read<TodoBloc>().add(StartPageOpen());
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => back(context),
        icon: const Icon(
          Icons.arrow_back_sharp,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blueAccent,
      title: const Text(
        'Completed',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
