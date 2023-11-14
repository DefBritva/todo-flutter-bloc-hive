import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/core/bloc/todo_bloc.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';
import 'package:my_todo_list/features/task/bloc/task_bloc.dart';
import 'package:my_todo_list/features/task/presentation/widgets/task_appbar.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late FocusNode textfieldFocusNode;
  final noteController = TextEditingController();
  late String name;
  late bool isEnabled;

  @override
  void initState() {
    super.initState();
    textfieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    textfieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskOpenedState) {
          name = state.note.name;
          isEnabled = true;
          // } else if (state is CompletedNoteOpenedState1) {
          //   isEnabled = false;
          //   textfieldFocusNode.unfocus();
          //   name = state.name;
          // } else if (state is FavoriteNoteOpenedState1) {
          //   name = state.favorits[state.currentNote].name;
          //   isEnabled = true;
          // } else if (state is ArchiveNoteOpenedState1) {
          //   name = state.archive[state.currentNote].name;
          //   isEnabled = false;
        }
        return Scaffold(
          appBar: TaskAppBar(
              name: name,
              textfieldFocusNode: textfieldFocusNode,
              noteController: noteController),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: UserSettings.width * 0.05,
                  vertical: UserSettings.height * 0.01),
              child: SizedBox(
                width: UserSettings.width * 0.9,
                child: BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    if (state is TaskOpenedState) {
                      noteController.text = state.note.text;
                      // } else if (state is CompletedNoteOpenedState1) {
                      //   noteController.text =
                      //       state.completedNotes[state.currentNote].text;
                      // } else if (state is FavoriteNoteOpenedState1) {
                      //   noteController.text =
                      //       state.favorits[state.currentNote].text;
                      // } else if (state is ArchiveNoteOpenedState1) {
                      //   noteController.text =
                      //       state.archive[state.currentNote].text;
                    }
                    return Theme(
                      data: ThemeData(disabledColor: Colors.black),
                      child: TextField(
                        enabled: isEnabled,
                        focusNode: textfieldFocusNode,
                        controller: noteController,
                        onTap: () => setState(() {
                          textfieldFocusNode.requestFocus();
                        }),
                        style: const TextStyle(fontSize: 20),
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        maxLines: 99999,
                        autofocus: false,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
