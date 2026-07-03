import 'package:flutter/material.dart';

class TodoAddDialog extends StatefulWidget {
  const TodoAddDialog({super.key});

  @override
  State<TodoAddDialog> createState() => _TodoAddDialogState();
}

class _TodoAddDialogState extends State<TodoAddDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Dialog(
      child: Padding(
        padding: .all(12),
        child: Column(
          mainAxisSize: .min,
          children: [
            Text("New ToDo", style: textTheme.titleLarge),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: "Enter a todo title"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: .end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"),
                ),
                ElevatedButton(
                  onPressed: () {
                    final title = _controller.text.trim();

                    if (title.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please enter a title")),
                      );
                      return;
                    }
                  },
                  child: Text("Add"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
