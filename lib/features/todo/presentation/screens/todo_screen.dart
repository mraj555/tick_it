import 'package:flutter/material.dart';
import 'package:tick_it/features/todo/presentation/widgets/overview_card.dart';
import 'package:tick_it/features/todo/presentation/widgets/todo_tile.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

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
    );
  }
}
