import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tick_it/features/todo/application/controller/todos/todos_controller.dart';

part 'completed_todos_provider.g.dart';

@riverpod
int onCompletedTodosCount(Ref ref) {
  final todos = ref.watch(
    todosControllerProvider.select((state) => state.todos),
  );

  return todos.where((todo) => todo.isCompleted).length;
}
