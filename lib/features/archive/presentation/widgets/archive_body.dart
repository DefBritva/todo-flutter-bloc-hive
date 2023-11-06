import 'package:flutter/material.dart';
import 'package:my_todo_list/features/archive/presentation/widgets/archive_tasks.dart';

class ArchiveBody extends StatelessWidget {
  const ArchiveBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: ArchiveTasks(),
    );
  }
}
