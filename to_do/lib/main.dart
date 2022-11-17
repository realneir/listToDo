import '/toDoList.dart';
import 'package:flutter/material.dart';

// class Task {
//   Task({required this.task});
//   final String task;
//   // bool status;
// }

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
