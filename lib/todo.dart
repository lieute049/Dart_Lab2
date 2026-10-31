class Todo {
  int id;
  String title;
  bool isDone;

  Todo({required this.id, required this.title}) : isDone = false;

  @override
  String toString() {
    String mark = isDone ? '[x]' : '[ ]';
    return '$mark $id. $title';
  }

  void complete() {
    isDone = true;
  }
}