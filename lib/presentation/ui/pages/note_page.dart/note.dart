import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userWidth = size.width;
    final userHeight = size.height;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          SizedBox(
            width: userWidth * 0.25,
          ),
          SizedBox(
            width: userWidth * 0.5,
            child: const FittedBox(
              fit: BoxFit.contain,
              child: AutoSizeText(
                maxLines: 1,
                'some data',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.pending,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: userWidth * 0.05, vertical: userHeight * 0.01),
          child: SizedBox(
            width: userWidth * 0.9,
            child: Expanded(
              child: TextField(
                style: TextStyle(fontSize: 20),
                maxLines: 99999,
                decoration: InputDecoration.collapsed(
                  hintText: "some data",
                ),
                autofocus: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
