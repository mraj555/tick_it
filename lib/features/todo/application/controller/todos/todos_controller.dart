import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tick_it/features/todo/application/state/todos_state.dart';
import 'package:tick_it/features/todo/domain/todo.dart';

part 'todos_controller.g.dart';

@riverpod
class TodosController extends _$TodosController {
  @override
  TodosState build() {
    return TodosState.initial();
  }

  void onAddTodo(String title) {
    final trimmed_title = title.trim();

    if (trimmed_title.isEmpty) {
      debugPrint("Please provide title");
      return;
    }

    final todo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: trimmed_title,
      isCompleted: false,
    );

    state = state.copyWith(todos: [...state.todos, todo]);
  }

  void onToggleTodo(String id) {
    final updatedTodos = state.todos.map((todo) {
      if (todo.id != id) {
        return todo;
      }

      return todo.copyWith(isCompleted: !todo.isCompleted);
    }).toList();

    state = state.copyWith(todos: updatedTodos);
  }

  void onDeleteTodo(String id) {
    final updatedTodos = state.todos.where((todo) => todo.id != id).toList();
    state = state.copyWith(todos: updatedTodos);
  }

  void onUpdateTodo(String id, String title) {
    final trimmed_title = title.trim();

    if (trimmed_title.isEmpty) return;

    final todo_exist = state.todos.any((todo) => todo.id == id);
    if (!todo_exist) {
      state = state.copyWith(errorMessage: "Could not update todo");
      return;
    }

    final updatedTodos = state.todos
        .map((todo) => todo.id == id ? todo.copyWith(title: trimmed_title) : todo)
        .toList();

    state = state.copyWith(todos: updatedTodos, errorMessage: null);
  }
}
