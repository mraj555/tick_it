import 'package:flutter/material.dart';
import 'package:tick_it/features/todo/presentation/widgets/overview_card.dart';
import 'package:tick_it/features/todo/presentation/widgets/todo_add_dialog.dart';
import 'package:tick_it/features/todo/presentation/widgets/todo_tile.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            OverviewCard(),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TodoTile();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => TodoAddDialog());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
