import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  void Function({required String todoText}) addTodo;
  AddTodo({super.key, required this.addTodo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController todoText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Add Task: "),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            onSubmitted: (value) {
              String task = todoText.text.trim();
              if (task.isNotEmpty) {
                widget.addTodo(
                    todoText: task); // Pass the task to addTodo function
                todoText.clear(); // Clear the text field after submission
              }
            },
            autofocus: true,
            controller: todoText,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                hintText: "Write Your Task Here ... "),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              String task =
                  todoText.text.trim(); // Remove leading and trailing spaces

              if (task.isNotEmpty) {
                widget.addTodo(
                    todoText: task); // Pass the task to addTodo function
                todoText.clear(); // Clear the text field after submission
              }
            },
            child: const Text("Submit"))
      ],
    );
  }
}
