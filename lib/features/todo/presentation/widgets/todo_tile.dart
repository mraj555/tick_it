import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Checkbox(value: true, onChanged: (value) {}, shape: CircleBorder()),
            Expanded(
              child: Text(
                "Task",
                style: textTheme.titleMedium?.copyWith(
                  decoration: TextDecoration.none,
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
