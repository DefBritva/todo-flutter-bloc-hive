import 'package:flutter/material.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: UserSettings.height * 0.66),
      child: SizedBox(
        height: UserSettings.height * 0.12,
        width: UserSettings.width * 0.45,
        child: Drawer(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('open archive'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('remove all tasks'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
