import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/model.dart';
import '../state/todo_state.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      leading: Checkbox(
        onChanged: (value) {
          context.read<TodoState>().toggleTodo(todo);
        },
        value: todo.done,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          context.read<TodoState>().deleteTodo(todo);
        },
      ),
    );
  }
}
