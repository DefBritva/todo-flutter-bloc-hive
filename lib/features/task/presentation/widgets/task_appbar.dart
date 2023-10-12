import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/core/presentation/bloc/todo_bloc.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';

class TaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaskAppBar({
    super.key,
    required this.name,
    required this.textfieldFocusNode,
    required this.noteController,
  });

  final String name;
  final FocusNode textfieldFocusNode;
  final TextEditingController noteController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(
        color: Colors.white,
      ),
      backgroundColor: Colors.blueAccent,
      actions: [
        SizedBox(
          width: UserSettings.width * 0.21,
        ),
        SizedBox(
          width: UserSettings.width * 0.55,
          child: FittedBox(
            fit: BoxFit.contain,
            child: AutoSizeText(
              maxLines: 1,
              name,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            debugPrint('${UserSettings.height}');
            debugPrint('${UserSettings.width}');
          },
          icon: const Icon(
            Icons.pending,
            color: Colors.white,
          ),
        ),
        textfieldFocusNode.hasFocus
            ? IconButton(
                onPressed: () {
                  final state = context.read<TodoBloc>().state;
                  if (state is NoteOpenedState) {
                    final index = state.currentNote;
                    final name = state.notes[index].name;
                    final text = noteController.text;
                    BlocProvider.of<TodoBloc>(context)
                        .add(UpdateNote(index, name, text));
                    FocusScope.of(context).unfocus();
                  }
                },
                icon: const Icon(Icons.done),
                color: Colors.white,
              )
            : Container()
      ],
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
