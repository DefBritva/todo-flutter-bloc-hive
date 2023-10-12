import 'package:flutter/material.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    super.key,
  });

  static void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/form');
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pinkAccent,
      onPressed: () => showForm(context),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
