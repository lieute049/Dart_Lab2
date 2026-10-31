import 'package:lab2_todo/todo.dart';

void main() {
  Todo task = Todo(1, 'купить продукты');
  print(task.id);
  print(task.title);
  print(task.isDone);
}