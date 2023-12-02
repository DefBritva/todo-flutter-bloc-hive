import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        noteController.text = state.task.text;
        if (state is TaskOpenedState) {
          name = state.task.name;
          isEnabled = true;
        } else if (state is FavoriteTaskOpenedState) {
          name = state.task.name;
          isEnabled = true;
        } else if (state is ArchiveTaskOpenedState) {
          name = state.task.name;
          isEnabled = false;
        } else if (state is CompletedTaskOpenedState) {
          textfieldFocusNode.unfocus();
          isEnabled = false;
          name = state.task.name;
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
                  child: Theme(
                    data: ThemeData(disabledColor: Colors.black),
                    child: TextField(
                      enabled: isEnabled,
                      focusNode: textfieldFocusNode,
                      controller: noteController,
                      onTap: () {
                        if (!textfieldFocusNode.hasFocus) {
                          setState(() {
                            textfieldFocusNode.requestFocus();
                          });
                        }
                      },
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      maxLines: 99999,
                      autofocus: false,
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
