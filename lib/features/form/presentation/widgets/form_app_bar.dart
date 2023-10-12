import 'package:flutter/material.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';

class FormAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FormAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: Padding(
        padding: EdgeInsets.only(left: UserSettings.width * 0.17),
        child: const Text(
          'Новая заметка',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
