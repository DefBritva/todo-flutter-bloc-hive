Паттерн Null Object.
Был использован для реализации метода clone(). В случае передачи параметра в метод, происходит клонирование с заменой
выбранного параметра, в случае, если параметры переданы не были, тогда они не изменяются и метод полностью копирует
объект. Так же был использован при вёрстке UI. 

Паттерн реализован оператором языка Dart "??" который в случае, если объект слева от ?? равен null использует объект
по умолчанию справа. 

пример использования:

int? foo = null  // опциональный int, который может быть null
int num = foo ?? 10 // num = foo , если foo != null. Если foo == null, то num = 10


пример использования:

class StartPageState extends StartState {
  const StartPageState({required super.tasks});

  @override
  StartState clone({
    List<Note>? tasks,
  }) {
    return StartPageState(tasks: tasks ?? this.tasks);
  }
}