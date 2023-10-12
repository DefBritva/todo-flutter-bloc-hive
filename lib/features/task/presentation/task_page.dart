import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/core/presentation/bloc/todo_bloc.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';
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
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is NoteOpenedState) {
          name = state.notes[state.currentNote].name;
          isEnabled = true;
        } else if (state is ArchiveNoteOpenedState) {
          isEnabled = false;
          textfieldFocusNode.unfocus();
          name = state.archiveNotes[state.currentNote].name;
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
                child: BlocBuilder<TodoBloc, TodoState>(
                  builder: (context, state) {
                    if (state is NoteOpenedState) {
                      noteController.text = state.notes[state.currentNote].text;
                    } else if (state is ArchiveNoteOpenedState) {
                      noteController.text =
                          state.archiveNotes[state.currentNote].text;
                    }
                    return TextField(
                      enabled: isEnabled,
                      focusNode: textfieldFocusNode,
                      controller: noteController,
                      onTap: () => setState(() {
                        textfieldFocusNode.requestFocus();
                      }),
                      style: const TextStyle(fontSize: 20),
                      maxLines: 99999,
                      decoration: const InputDecoration.collapsed(
                        hintText: "",
                      ),
                      autofocus: false,
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
