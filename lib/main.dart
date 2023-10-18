import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './state/todo_state.dart';
import './ui/app.dart';
import 'db/db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DB db = DB();
  await db.init();

  TodoState state = TodoState(db);

  runApp(ChangeNotifierProvider(
    create: (context) => state,
    child: const App(),
  ));
}
