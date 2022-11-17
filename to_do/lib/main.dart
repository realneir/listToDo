import '/toDoList.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ToDoList());

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListoDotoronto',
      home: ToDoApp(),
    );
  }
}
