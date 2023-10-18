import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/model.dart';
import '../state/todo_state.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add todo')),
        body: Column(
          children: [
            TextField(controller: _controller),
            ElevatedButton(
              onPressed: () {
                context.read<TodoState>().addTodo(_controller.text);
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ));
  }
}
