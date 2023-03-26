import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_item_model.dart';

class TodoListModel extends ChangeNotifier {
  final List<TodoItemModel> _todos = [
    TodoItemModel(
        title: "Study Math", category: "studies", isCompleted: false, id: 0),
    TodoItemModel(
        title: "Run 20mins", category: "sports", isCompleted: false, id: 1),
    TodoItemModel(
        title: "Cook Lunch", category: "chores", isCompleted: true, id: 2),
    TodoItemModel(
        title: "Walk the Dog", category: "chores", isCompleted: false, id: 3),
    TodoItemModel(
        title: "Get Coffee", category: "pleasure", isCompleted: false, id: 4),
    TodoItemModel(
        title: "Laundry", category: "chores", isCompleted: false, id: 5),
    TodoItemModel(
        title: "GO jim", category: "sports", isCompleted: true, id: 6),
    TodoItemModel(
        title: "Homework", category: "studies", isCompleted: false, id: 7),
    TodoItemModel(
        title: "Do the Dishes", category: "chores", isCompleted: false, id: 8),
    TodoItemModel(
        title: "Call my Mom",
        category: "friends/family",
        isCompleted: true,
        id: 9),
    TodoItemModel(
        title: "Go on a Picnic",
        category: "friends/family",
        isCompleted: false,
        id: 10),
    TodoItemModel(
        title: "Go Shopping", category: "shopping", isCompleted: true, id: 11),
  ];

  List<TodoItemModel> get todos => _todos;
  void toggleCompleted(TodoItemModel todo) {
    todo.isCompleted = !todo.isCompleted; //to fix
    notifyListeners();
  }

  void addTodo(TodoItemModel todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(TodoItemModel todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
