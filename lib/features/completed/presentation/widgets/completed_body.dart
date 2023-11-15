import 'package:flutter/material.dart';
import 'package:my_todo_list/features/completed/presentation/widgets/completed_tasks.dart';

class CompletedBody extends StatelessWidget {
  const CompletedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CompletedTasks(),
    );
  }
}
