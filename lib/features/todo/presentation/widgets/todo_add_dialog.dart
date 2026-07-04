import 'package:flutter/material.dart';

typedef AddOrEditTodoCallback = void Function(String);

class TodoAddDialog extends StatefulWidget {
  final AddOrEditTodoCallback onAddTodo;
  final String title;
  final bool isEdit;

  const TodoAddDialog({
    super.key,
    required this.onAddTodo,
    this.isEdit = false,
    this.title = "",
  });

  @override
  State<TodoAddDialog> createState() => _TodoAddDialogState();
}

class _TodoAddDialogState extends State<TodoAddDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.isEdit) {
      _controller.text = widget.title;
    }
    super.initState();
  }

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
            Text(
              widget.isEdit ? "Update ToDo" : "New ToDo",
              style: textTheme.titleLarge,
            ),
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

                    widget.onAddTodo(title);
                    Navigator.pop(context);
                  },
                  child: Text(widget.isEdit ? "Update" : "Add"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
