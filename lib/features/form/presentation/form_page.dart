import 'package:flutter/material.dart';
import 'package:my_todo_list/features/form/presentation/widgets/form_app_bar.dart';
import 'package:my_todo_list/features/form/presentation/widgets/form_body.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: FormAppBar(),
      body: FormBody(),
    );
  }
}
