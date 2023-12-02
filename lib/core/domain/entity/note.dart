// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'note.g.dart';

//Используем аннотацию @HiveType для возможности последующего сохранения
// класса в базу данных Hive. Для этого используется сгенерированный класс
// NoteAdapter в файле note.g.dart
@HiveType(typeId: 1)

// Сущность заметки.
class Note extends Equatable {
  @HiveField(1)
  final String name;

  @HiveField(2)
  final String text;

  @HiveField(3)
  final bool done;

  @HiveField(4)
  final bool isFavorite;

  const Note({
    required this.name,
    this.text = '', // при добавлении новой заметки, она сохраняется в раздел
    this.done = false, // tasks, где она не является выполненной и не является
    this.isFavorite = false, // избранной, текст задается заметке при переходе
  }); // на неё.

  @override
  List<Object?> get props => [name, text, done];

  Note clone({
    String? name,
    String? text,
    bool? done,
    bool? isFavorite,
  }) {
    return Note(
      name: name ?? this.name,
      text: text ?? this.text,
      done: done ?? this.done,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
