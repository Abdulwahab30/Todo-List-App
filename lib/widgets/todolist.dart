import 'package:flutter/material.dart';

class TodoListBuilder extends StatefulWidget {
  List<String> todoList;
  void Function() updateLocalData;
  TodoListBuilder(
      {super.key, required this.todoList, required this.updateLocalData});

  @override
  State<TodoListBuilder> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TodoListBuilder> {
  @override
  Widget build(BuildContext context) {
    return (widget.todoList.isEmpty)
        ? const Center(
            child: Text(
            "No Tasks To be Done",
            style: TextStyle(fontSize: 30),
          ))
        : ListView.builder(
            itemCount: widget.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                background: Container(
                  color: Colors.green[300],
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.check),
                      ),
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    widget.todoList.removeAt(index);
                  });
                  widget.updateLocalData();
                },
                child: ListTile(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    widget.todoList.removeAt(index);
                                  });
                                  widget.updateLocalData();
                                  Navigator.pop(context);
                                },
                                child: const Text("Mark as Done")),
                          );
                        });
                  },
                  title: Text(widget.todoList[index]),
                ),
              );
            });
  }
}
