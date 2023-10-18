class Todo {
  final int id;
  final String title;
  bool done;

  Todo({required this.id, required this.title, this.done = false});

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      done: map['done'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'done': done ? 1 : 0,
    };
  }
}

enum Filter { all, done, undone }
