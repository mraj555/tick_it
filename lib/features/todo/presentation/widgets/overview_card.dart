import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  final int completed_todo;
  final int total_todo;

  const OverviewCard({
    super.key,
    required this.completed_todo,
    required this.total_todo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Card(
      color: theme.cardColor.withAlpha(100),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "TickIt Progress",
                    style: textTheme.titleLarge?.copyWith(fontWeight: .bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Complete Your First Task",
                    style: textTheme.bodyMedium?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              padding: .symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: .circular(12),
              ),
              child: Text(
                "$completed_todo/$total_todo",
                style: textTheme.titleMedium?.copyWith(fontWeight: .bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
