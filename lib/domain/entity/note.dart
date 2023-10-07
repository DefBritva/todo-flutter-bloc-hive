import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String text;

  @HiveField(2)
  bool done;

  Note({required this.name, this.text = '', this.done = false});
}
