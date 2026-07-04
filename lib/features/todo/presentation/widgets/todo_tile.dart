import 'package:flutter/material.dart';
import 'package:tick_it/features/todo/domain/todo.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;

  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Checkbox(value: todo.isCompleted, onChanged: (value) {}, shape: CircleBorder()),
            Expanded(
              child: Text(
                todo.title,
                style: textTheme.titleMedium?.copyWith(
                  decoration: todo.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline)),
          ],
        ),
      ),
    );
  }
}
