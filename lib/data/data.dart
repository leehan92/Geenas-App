import 'package:hive/hive.dart';
import 'package:to_do_app_tutorial/models/todo_class.dart';


class ToDoDatabase {
  List<Todo> toDoList = [];
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      Todo("Laundry", false),
      Todo("Dishes", false),
      Todo("Litter", false),
      Todo("Daily Reading", false),
      Todo("Trash", false),
      Todo("Run", false),
      Todo("Daily Research",false),
      Todo("Daily Step 2 Practice",false)
    ];
    // Save as List of Maps
    _myBox.put("TODOLIST", toDoList.map((todo) => {
      'task': todo.task,
      'isDone': todo.isDone
    }).toList());
  }

  void loadData() {
    // Load and convert from List of Maps to List<Todo>
    final List<dynamic> todoData = _myBox.get("TODOLIST") ?? [];
    toDoList = todoData.map((item) => Todo(
      item['task'] as String,
      item['isDone'] as bool
    )).toList();
  }

  void updateDataBase() {
    // Save as List of Maps
    _myBox.put("TODOLIST", toDoList.map((todo) => {
      'task': todo.task,
      'isDone': todo.isDone
    }).toList());
  }
}