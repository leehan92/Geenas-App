class Todo {
  String task;
  bool isDone;
  Todo(this.task, this.isDone);

  // Convert Todo to a map for storage
  Map<String, dynamic> toMap() {
    return {
      'task': task,
      'isDone': isDone,
    };
  }
}