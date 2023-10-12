import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_todo_list/core/domain/entity/note.dart';
import 'package:my_todo_list/core/presentation/bloc/todo_bloc.dart';

class Archive extends StatelessWidget {
  const Archive({super.key});

  static void showNote(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/note');
  }

  static void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/form');
  }

  static void back(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/groups');
    context.read<TodoBloc>().add(StartPageOpen());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => back(context),
            icon: const Icon(
              Icons.notes,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Completed',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is ArchiveState) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    Note note = state.archiveNotes[index];
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            flex: 1,
                            onPressed: (context) =>
                                BlocProvider.of<TodoBloc>(context)
                                    .add(UnnarchiveNote(note.name, index)),
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.white,
                            icon: Icons.archive,
                            label: 'unarchive',
                          ),
                          SlidableAction(
                            onPressed: (context) =>
                                BlocProvider.of<TodoBloc>(context).add(
                                    DeleteArchiveNote(indexToDelete: index)),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Checkbox(
                          value: note.done,
                          onChanged: (_) {},
                        ),
                        title: Text(note.name),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          BlocProvider.of<TodoBloc>(context)
                              .add(ArchiveNoteClicked(index));
                          showNote(context);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: height * 0.001,
                        color: Colors.black,
                      ),
                  itemCount: state.archiveNotes.length);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
