import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/core/bloc/todo_bloc.dart';
import 'package:my_todo_list/core/utils/navigation.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoAppBar(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return AppBar(
          leading: state is StartPageState
              ? IconButton(
                  onPressed: () {
                    context.read<TodoBloc>().add(FavoritesOpen());
                    AppNavigation.showFavorites(context);
                  },
                  icon: const Icon(
                    Icons.star,
                    color: Colors.white,
                  ))
              : IconButton(
                  onPressed: () {
                    context.read<TodoBloc>().add(StartPageOpen());
                    AppNavigation.showNotes(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                  )),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<TodoBloc>().add(CompletedOpen());
                  AppNavigation.showCompleted(context);
                },
                icon: const Icon(
                  Icons.done,
                  color: Colors.white,
                )),
            const MyIconButton()
          ],
          backgroundColor: Colors.blueAccent,
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        );
      },
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
