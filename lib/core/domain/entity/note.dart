import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
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
    this.text = '',
    this.done = false,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [name, text, done];
}
