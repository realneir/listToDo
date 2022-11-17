import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  ListState createState() => ListState();
}

class ListState extends State<ToDoApp> {
  List todos = [
    "Eat",
    "Play",
    "Sleep",
    "Play Again",
  ];
  String text = '';
  final TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: ListTile(
                  title: Text(todos[index]),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        Expanded(
                            child: IconButton(
                                color: Colors.black26,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => SimpleDialog(
                                            contentPadding:
                                                const EdgeInsets.all(05),
                                            children: [
                                              TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    text = value;
                                                  });
                                                },
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      todos[index] = text;
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors
                                                        .black, // Background color
                                                  ),
                                                  child: const Text("Edit"))
                                            ],
                                          ));
                                },
                                icon: const Icon(Icons.edit))),
                        Expanded(
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    todos.removeAt(index);
                                  });
                                },
                                icon: const Icon(Icons.delete))),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black54,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                      contentPadding: const EdgeInsets.all(20),
                      children: [
                        TextField(
                          controller: input,
                          decoration:
                              const InputDecoration(hintText: "Add a to do"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                              todos.add(input.text);
                            });

                            input.clear();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // Background color
                          ),
                          child: const Text("Add"),
                        ),
                      ],
                    ));
          },
          child: const Icon(Icons.add)),
    );
  }
}
