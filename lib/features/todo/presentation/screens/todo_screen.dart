import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tick_it/features/todo/application/controller/completed_todos/completed_todos_provider.dart';
import 'package:tick_it/features/todo/application/controller/todos/todos_controller.dart';
import 'package:tick_it/features/todo/presentation/widgets/overview_card.dart';
import 'package:tick_it/features/todo/presentation/widgets/todo_add_dialog.dart';
import 'package:tick_it/features/todo/presentation/widgets/todo_tile.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todosControllerProvider);
    final completed_count = ref.watch(onCompletedTodosCountProvider);

    final todos = state.todos;
    final isLoading = state.isLoading;
    final errorMessage = state.errorMessage;

    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage != null
          ? Center(child: Text(errorMessage))
          : todos.isEmpty
          ? Center(child: Text("No Todos yet. Add your first todo."))
          : SafeArea(
              child: Column(
                children: [
                  OverviewCard(
                    completed_todo: completed_count,
                    total_todo: todos.length,
                  ),
                  SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return TodoTile(
                          todo: todos[index],
                          onDeleteTodo: () => ref
                              .read(todosControllerProvider.notifier)
                              .onDeleteTodo(todos[index].id),
                          onToggleTodo: () => ref
                              .read(todosControllerProvider.notifier)
                              .onToggleTodo(todos[index].id),
                          onUpdateTodo: () {
                            showDialog(
                              context: context,
                              builder: (context) => TodoAddDialog(
                                onAddTodo: (value) => ref
                                    .read(todosControllerProvider.notifier)
                                    .onUpdateTodo(
                                      todos[index].id,
                                      value.trim(),
                                    ),
                                isEdit: true,
                                title: todos[index].title.trim(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => TodoAddDialog(
              onAddTodo: (title) {
                ref.read(todosControllerProvider.notifier).onAddTodo(title);
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
