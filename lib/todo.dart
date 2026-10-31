class Todo {
  static int _counter = 0;

  int id;
  String title;
  bool isDone;

  Todo({required this.title}) : id = ++_counter, isDone = false;

  String get status => isDone ? 'выполнено' : 'в процессе';

  @override
  String toString() {
    String mark = isDone ? '[x]' : '[ ]';
    return '$mark $id. $title ($status)';
  }

  void complete() {
    isDone = true;
  }
}