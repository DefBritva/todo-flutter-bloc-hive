import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:my_todo_list/presentation/bloc/todo_bloc.dart';

class NoteWidget extends StatefulWidget {
  const NoteWidget({super.key});

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  late FocusNode textfieldFocusNode;

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
        final noteController = TextEditingController();
        late String name;
        late bool isEnabled;
        final size = MediaQuery.of(context).size;
        final userWidth = size.width;
        final userHeight = size.height;
        if (state is NoteOpenedState) {
          name = state.notes[state.currentNote].name;
          isEnabled = true;
        } else if (state is ArchiveNoteOpenedState) {
          isEnabled = false;
          textfieldFocusNode.unfocus();
          name = state.archiveNotes[state.currentNote].name;
        }
        return Scaffold(
          appBar: AppBar(
            leading: const BackButton(
              color: Colors.white,
            ),
            backgroundColor: Colors.blueAccent,
            actions: [
              SizedBox(
                width: userWidth * 0.25,
              ),
              SizedBox(
                width: userWidth * 0.5,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: AutoSizeText(
                    minFontSize: 10,
                    maxFontSize: 10,
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
                onPressed: () {},
                icon: const Icon(
                  Icons.pending,
                  color: Colors.white,
                ),
              ),
              textfieldFocusNode.hasFocus
                  ? IconButton(
                      onPressed: () {
                        if (state is NoteOpenedState) {
                          FocusScope.of(context).unfocus();
                          final index = state.currentNote;
                          final name = state.notes[index].name;
                          final text = noteController.text;

                          BlocProvider.of<TodoBloc>(context)
                              .add(UpdateNoteEvent(index, name, text));
                        }
                      },
                      icon: const Icon(Icons.done),
                      color: Colors.white,
                    )
                  : Container()
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: userWidth * 0.05, vertical: userHeight * 0.01),
              child: SizedBox(
                width: userWidth * 0.9,
                child: Expanded(
                  child: BlocBuilder<TodoBloc, TodoState>(
                    builder: (context, state) {
                      if (state is NoteOpenedState) {
                        noteController.text =
                            state.notes[state.currentNote].text;
                      } else if (state is ArchiveNoteOpenedState) {
                        noteController.text =
                            state.archiveNotes[state.currentNote].text;
                      }
                      return TextField(
                        enabled: isEnabled,
                        focusNode: textfieldFocusNode,
                        controller: noteController,
                        onTap: () => textfieldFocusNode.requestFocus(),
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
          ),
        );
      },
    );
  }
}
