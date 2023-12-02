part of 'box_service.dart';

// объявляем боксы для взаимодействия с данными (Hive database)
late Box<Note> tasksBox;
late Box<Note> completedTasksBox;
late Box<Note> favoritesTasksBox;
late Box<Note> archiveTasksBox;
