import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db/db.dart';
import './model.dart';

class TodoState extends ChangeNotifier {
  final DB _db;

  List<Todo> _todos = [];
  Filter _filter = Filter.all;

  List<Todo> get todos => _todos;
  Filter get filter => _filter;

  TodoState(DB db) : _db = db {
    fetchTodos();
    initFilter();
  }

  void initFilter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var filter = prefs.getString('filter');
    switch (filter) {
      case 'done':
        _filter = Filter.done;
        break;
      case 'undone':
        _filter = Filter.undone;
        break;
      default:
        _filter = Filter.all;
        break;
    }
  }

  void fetchTodos() async {
    _todos = await _db.getTodos();
    notifyListeners();
  }

  List<Todo> get filtered => _todos
      .where(
        (element) => _filter == Filter.all
            ? true
            : _filter == Filter.done
                ? element.done
                : !element.done,
      )
      .toList();

  void addTodo(String title) {
    _db.addTodo(Todo(id: _todos.length, title: title));
    fetchTodos();
  }

  void toggleTodo(Todo todo) async {
    todo.done = !todo.done;
    await _db.updateTodo(todo);
    fetchTodos();
  }

  void deleteTodo(Todo todo) {
    _db.deleteTodo(todo.id);
    fetchTodos();
  }

  void setFilter(Filter filter) async {
    _filter = filter;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('filter', _filter.name);
  }
}
