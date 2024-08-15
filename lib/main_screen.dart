import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/add_todo.dart';
import 'package:todoapp/widgets/todolist.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = [];

  @override
  void initState() {
    super.initState();
    loadData(); // Load saved data when the app starts
  }

  void addTodo({required String todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Already exist"),
              content: const Text("This todo data already exist"),
              actions: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Close"))
              ],
            );
          });
      return;
    }
    setState(() {
      todoList.insert(0, todoText);
    });
    updateLocalData();
    Navigator.pop(context);
  }

  void updateLocalData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('todoList', todoList);
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    todoList = (prefs.getStringList("todoList") ?? []).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      height: 200,
                      child: AddTodo(
                        addTodo: addTodo,
                      ),
                    ),
                  );
                });
          },
          shape: const CircleBorder(),
          backgroundColor: Colors.blueGrey[900],
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                color: Colors.blueGrey[900],
                height: 200,
                width: double.infinity,
                child: const Center(
                  child: Text(
                    "TO DO App",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  launchUrl(Uri.parse("https://abdulwahab30.github.io/#home"));
                },
                leading: const Icon(Icons.person),
                title: const Text(
                  "About Me",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  launchUrl(Uri.parse("mailto:a.wahab40214@gmail.com"));
                },
                leading: const Icon(Icons.email),
                title: const Text(
                  "Contact Me",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("To Do App"),
        ),
        body: TodoListBuilder(
          todoList: todoList,
          updateLocalData: updateLocalData,
        ));
  }
}
