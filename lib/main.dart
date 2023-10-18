import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './state/todo_state.dart';
import './ui/app.dart';

void main() {
  TodoState state = TodoState();

  runApp(ChangeNotifierProvider(
    create: (context) => state,
    child: const App(),
  ));
}
