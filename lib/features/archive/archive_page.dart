import 'package:flutter/material.dart';
import 'package:my_todo_list/features/archive/presentation/widgets/archive_appbar.dart';
import 'package:my_todo_list/features/archive/presentation/widgets/archive_body.dart';
import 'package:my_todo_list/features/archive/presentation/widgets/archive_menu_drawer.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ArchiveAppBar(),
      body: ArchiveBody(),
      endDrawer: ArchiveMenuDrawer(),
    );
  }
}
