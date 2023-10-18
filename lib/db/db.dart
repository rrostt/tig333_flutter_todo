import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../state/model.dart';

class DB {
  Database? _db;

  Future<void> init() async {
    var path = join(await getDatabasesPath(), 'todo7_db.db');
    _db = await openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE todos (id INTEGER PRIMARY KEY NOT NULL, title TEXT, done BOOL)");
      },
      version: 2,
    );
  }

  Future<List<Todo>> getTodos() async {
    List<Map<String, dynamic>> results = await _db!.query("todos");
    return results.map((result) => Todo.fromMap(result)).toList();
  }

  Future<void> addTodo(Todo todo) async {
    await _db!.insert("todos", todo.toMap());
  }

  Future<void> updateTodo(Todo todo) async {
    await _db!
        .update("todos", todo.toMap(), where: "id = ?", whereArgs: [todo.id]);
  }

  Future<void> deleteTodo(int id) async {
    await _db!.delete("todos", where: "id = ?", whereArgs: [id]);
  }
}
