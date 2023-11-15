import 'package:flutter/material.dart';
import 'package:my_todo_list/features/completed/presentation/widgets/completed_appbar.dart';
import 'package:my_todo_list/features/completed/presentation/widgets/completed_body.dart';
import 'package:my_todo_list/features/completed/presentation/widgets/completed_menu_drawer.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CompletedAppBar(),
      body: CompletedBody(),
      endDrawer: CompletedMenuDrawer(),
    );
  }
}
