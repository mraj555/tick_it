import 'package:flutter/material.dart';
import 'package:tick_it/features/todo/presentation/screens/todo_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: TodoScreen(),
    );
  }
}
