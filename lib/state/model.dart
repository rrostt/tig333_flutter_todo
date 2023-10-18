class Todo {
  final String id;
  final String title;
  bool done;

  Todo({required this.id, required this.title, this.done = false});
}

enum Filter { all, done, undone }
