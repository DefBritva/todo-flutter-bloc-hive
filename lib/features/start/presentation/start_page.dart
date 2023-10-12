import 'package:flutter/material.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';
import 'package:my_todo_list/features/start/presentation/widgets/add_note_button.dart';
import 'package:my_todo_list/features/start/presentation/widgets/menu_drawer.dart';
import 'package:my_todo_list/features/start/presentation/widgets/start_appbar.dart';
import 'package:my_todo_list/features/start/presentation/widgets/start_body.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    UserSettings.setSize(size);
    return const Scaffold(
      appBar: StartAppBar(),
      endDrawer: MenuDrawer(),
      body: StartBody(),
      floatingActionButton: AddNoteButton(),
    );
  }
}
