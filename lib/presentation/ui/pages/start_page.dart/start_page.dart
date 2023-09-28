import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_todo_list/domain/entity/note.dart';
import 'package:my_todo_list/presentation/bloc/todo_bloc.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/form');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Center(
          child: Text(
            'Заметки',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: const SafeArea(
        child: _GroupsList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () => showForm(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _GroupsList extends StatelessWidget {
  const _GroupsList();

  void showNote(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/note');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;

    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) {
              Note note = state.notes[index];
              return Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      flex: 1,
                      onPressed: (context) => () {},
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      icon: Icons.archive,
                      label: 'Archive',
                    ),
                    SlidableAction(
                      onPressed: (context) => BlocProvider.of<TodoBloc>(context)
                          .add(DeleteButtonPressed(indexToDelete: index)),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(note.name),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => showNote(context),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  height: height * 0.001,
                  color: Colors.black,
                ),
            itemCount: state.notes.length);
      },
    );
  }
}
