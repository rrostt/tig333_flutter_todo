import 'package:flutter/material.dart';

import './model.dart';

class TodoState extends ChangeNotifier {
  final List<Todo> _todos = [];
  Filter _filter = Filter.done;

  List<Todo> get todos => _todos;
  Filter get filter => _filter;

  List<Todo> get filtered => _todos
      .where(
        (element) => _filter == Filter.all
            ? true
            : _filter == Filter.done
                ? element.done
                : !element.done,
      )
      .toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    todo.done = !todo.done;
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void setFilter(Filter filter) {
    _filter = filter;
    notifyListeners();
  }
}
