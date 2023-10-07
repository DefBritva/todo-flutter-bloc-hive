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

  void showArchive(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/groups/archive');
    context.read<TodoBloc>().add(ArchiveOpenEvent());
  }

  void showNote(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/note');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Icons.archive,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Notes',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
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

    return BlocConsumer<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state is DeleteButtonPressed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Delete Button pressed'),
              duration: Duration(milliseconds: 1000),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is StartPageState) {
          return ListView.separated(
              itemBuilder: (context, index) {
                Note note = state.notes[index];
                bool isDone = note.done;
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        flex: 1,
                        onPressed: (context) =>
                            BlocProvider.of<TodoBloc>(context)
                                .add(ArchiveNote(note.name, index)),
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                        label: 'Archive',
                      ),
                      SlidableAction(
                        onPressed: (context) =>
                            BlocProvider.of<TodoBloc>(context)
                                .add(DeleteButtonPressed(indexToDelete: index)),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: MyCheckBox(index),
                    title: Text(note.name),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      BlocProvider.of<TodoBloc>(context)
                          .add(NoteClicked(index));
                      showNote(context);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    height: height * 0.001,
                    color: Colors.black,
                  ),
              itemCount: state.notes.length);
        } else {
          return Container();
        }
      },
    );
  }
}

class MyCheckBox extends StatefulWidget {
  const MyCheckBox(this.index, {super.key});
  final int index;

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isDone,
      onChanged: (value) {
        setState(() {
          isDone = value!;
        });
      },
    );
  }
}
