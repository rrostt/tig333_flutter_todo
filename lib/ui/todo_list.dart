import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/model.dart';
import '../state/todo_state.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Todo> todos = context.watch<TodoState>().filtered;
    return ListView.builder(
      itemBuilder: (context, index) => TodoItem(todos[index]),
      itemCount: todos.length,
    );
  }
}
