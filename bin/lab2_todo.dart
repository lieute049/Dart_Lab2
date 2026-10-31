import 'package:lab2_todo/todo.dart';

void main() {
  Todo task1 = Todo(id: 1, title: 'купить продукты');
  Todo task2 = Todo(id: 2, title: 'сделать зарядку');
  task1.complete();
  print(task1);
  print(task2);
}