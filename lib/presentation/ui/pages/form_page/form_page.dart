import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/presentation/bloc/todo_bloc.dart';
import 'package:my_todo_list/services/todo.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _FormWidget();
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _formController = TextEditingController();
  String inputName = '';

  void backToStartPage(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Padding(
          padding: EdgeInsets.only(left: size.width * 0.17),
          child: const Text(
            'Новая заметка',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
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
                height: size.height * 0.02,
              ),
              ElevatedButton(
                onPressed: () {
                  inputName = _formController.text;
                  BlocProvider.of<TodoBloc>(context)
                      .add(SaveButtonPressed(noteName: inputName));
                  backToStartPage(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent),
                child: const Text('Сохранить'),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _formController.dispose();
    super.dispose();
  }
}
