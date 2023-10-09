import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final bool done;

  const Note({required this.name, this.text = '', this.done = false});

  @override
  List<Object?> get props => [name, text, done];
}
