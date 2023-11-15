import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/core/utils/user_settings.dart';
import 'package:my_todo_list/features/start/bloc/start_bloc.dart';

class FormBody extends StatefulWidget {
  const FormBody({super.key});

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final _formController = TextEditingController();
  String inputName = '';

  void backToStartPage(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: UserSettings.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              maxLength: 30,
              controller: _formController,
              onSubmitted: (value) {},
              autofocus: true,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.75), width: 1.5),
                  ),
                  hintText: "Введите имя заметки",
                  border: const OutlineInputBorder()),
            ),
            SizedBox(
              height: UserSettings.height * 0.02,
            ),
            ElevatedButton(
              onPressed: () {
                inputName = _formController.text;
                BlocProvider.of<StartBloc>(context)
                    .add(SaveButtonPressed(taskName: inputName));
                backToStartPage(context);
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
              child: const Text('Сохранить'),
            )
          ],
        ),
      ),
    );
  }
}
