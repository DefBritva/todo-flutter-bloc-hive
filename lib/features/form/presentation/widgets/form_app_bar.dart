import 'package:flutter/material.dart';

class FormAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FormAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: const Text(
        'New task',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
