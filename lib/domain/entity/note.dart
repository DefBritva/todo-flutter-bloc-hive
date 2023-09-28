import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  String name;

  @HiveField(1)
  String text;

  Note({required this.name, this.text = ''});
}
