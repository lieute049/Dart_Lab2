import 'dart:io';
import 'package:lab2_todo/todo.dart';

void printMenu() {
  print('');
  print('ToDo список');
  print('add - добавить задачу');
  print('list - показать все задачи');
  print('done - отметить выполненной');
  print('delete - удалить задачу');
  print('exit - выйти');
}

void addTodo(List<Todo> todos) {
  stdout.write('название задачи: ');
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print('ошибка: название не может быть пустым');
    return;
  }

  int newId = todos.isEmpty ? 1 : todos.last.id + 1;
  todos.add(Todo(id: newId, title: input.trim()));
  print('задача добавлена!');
}

void listTodos(List<Todo> todos) {
  if (todos.isEmpty) {
    print('список задач пуст');
    return;
  }

  print('');
  for (var todo in todos) {
    print(todo);
  }
}

void completeTodo(List<Todo> todos) {
  stdout.write('id задачи: ');
  String? input = stdin.readLineSync();
  if (input == null) return;

  int? id = int.tryParse(input.trim());
  if (id == null) {
    print('ошибка: введите число');
    return;
  }

  for (var todo in todos) {
    if (todo.id == id) {
      todo.complete();
      print('задача отмечена выполненной!');
      return;
    }
  }
  print('задача с id $id не найдена');
}

void deleteTodo(List<Todo> todos) {
  stdout.write('id задачи: ');
  String? input = stdin.readLineSync();
  if (input == null) return;

  int? id = int.tryParse(input.trim());
  if (id == null) {
    print('ошибка: введите число');
    return;
  }

  for (int i = 0; i < todos.length; i++) {
    if (todos[i].id == id) {
      todos.removeAt(i);
      print('задача удалена!');
      return;
    }
  }
  print('задача с id $id не найдена');
}

void main() {
  List<Todo> todos = [];
  printMenu();

  while (true) {
    stdout.write('> ');
    String? input = stdin.readLineSync();
    if (input == null) continue;

    String command = input.trim().toLowerCase();
    if (command.isEmpty) continue;

    switch (command) {
      case 'add':
        addTodo(todos);
        break;
      case 'list':
        listTodos(todos);
        break;
      case 'done':
        completeTodo(todos);
        break;
      case 'delete':
        deleteTodo(todos);
        break;
      case 'exit':
        print('пока, пока');
        return;
      default:
        printMenu();
        print('неизвестная команда.');
    }
  }
}