import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/model.dart';
import '../state/todo_state.dart';
import 'add_todo_screen.dart';
import 'todo_list.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
        actions: _actions(context),
      ),
      body: const TodoList(),
      floatingActionButton: _addButton(context),
    );
  }

  Widget _addButton(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddTodoScreen()));
        },
        child: const Icon(Icons.add));
  }

  List<Widget> _actions(BuildContext context) {
    return [
      PopupMenuButton(
        itemBuilder: (context) => Filter.values
            .map((value) => PopupMenuItem(
                  value: value,
                  child: Text(value.name),
                ))
            .toList(),
        onSelected: (value) {
          context.read<TodoState>().setFilter(value);
        },
      ),
    ];
  }
}
