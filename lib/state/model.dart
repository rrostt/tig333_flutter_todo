class Todo {
  final String title;
  bool done;

  Todo({required this.title, this.done = false});
}

enum Filter { all, done, undone }
