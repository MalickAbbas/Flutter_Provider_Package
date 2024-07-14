import 'package:flutter/foundation.dart';
import 'todo.dart';

class TodoListModel with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodoAtIndex(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
