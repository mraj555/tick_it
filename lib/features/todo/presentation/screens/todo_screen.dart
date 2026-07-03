import 'package:flutter/material.dart';
import 'package:tick_it/features/todo/presentation/widgets/overview_card.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [OverviewCard()])),
    );
  }
}
