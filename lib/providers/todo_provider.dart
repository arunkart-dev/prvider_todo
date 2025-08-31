import 'package:flutter/widgets.dart';
import 'package:prvider_todo/model/todomodel.dart';

class TodoProvider with ChangeNotifier {
  final List<Todomodel> _todos = [];
  List<Todomodel> get todos => _todos;

  void addtodo(Todomodel todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void deletetodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  void toggletodo(int index) {
    final todo = _todos[index];
    _todos[index] = Todomodel(
      title: todo.title,
      description: todo.description,
      date: todo.date,
      completed: !todo.completed,
    );
  }

  void updatetodo(int index, Todomodel newtodo) {
    _todos[index] = newtodo;
    notifyListeners();
  }

  void cleartoos() {
    _todos.clear();
    notifyListeners();
  }
}
