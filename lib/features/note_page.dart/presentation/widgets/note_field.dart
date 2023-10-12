import 'package:flutter/material.dart';

class NoteField extends StatelessWidget {
  const NoteField({
    super.key,
    required this.isEnabled,
    required this.textfieldFocusNode,
    required this.noteController,
  });

  final bool isEnabled;
  final FocusNode textfieldFocusNode;
  final TextEditingController noteController;

  @override
  Widget build(BuildContext context) {
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
  }
}
