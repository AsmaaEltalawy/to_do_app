import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/components/dialogebox.dart';
import 'package:to_do_app/components/todoraw.dart';
import 'package:to_do_app/data/database.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
 var todoDatabase = ToDoDataBase();
  final _controller = TextEditingController();

  @override
  void initState() {
    todoDatabase.loadData();

  }
  void oncheckboxchange(bool? value, int index) {
    setState(() {
      todoDatabase.todoList[index][1] = !todoDatabase.todoList[index][1];
   todoDatabase.updateDataBase();
    }
    );
  }

  void savenewtask() {
setState(() {
  todoDatabase.todoList.add([_controller.text,false]);
  todoDatabase.updateDataBase();
});
_controller.clear();
Navigator.pop(context);
  }

  void canceldialoge() {
    _controller.clear();
    Navigator.pop(context);
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogeBox(
            controller: _controller,
            onSave:savenewtask,
            onCancel:canceldialoge,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink,
        title: const Text(
          "To Do List",
          style: TextStyle(color: Colors.white),
        ),
      ), //AppBar
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: createNewTask,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: todoDatabase.todoList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(todoDatabase.todoList[index][0]),
              direction: DismissDirection.endToStart,
              onDismissed: (direction){
                setState(() {
                  todoDatabase.todoList.removeAt(index);
                  todoDatabase.updateDataBase();
                });
              },
              child: ToDoRaw(
                taskName: todoDatabase.todoList[index][0],
                taskCompleted: todoDatabase.todoList[index][1],
                onchanged: (value) => oncheckboxchange(value, index),
              ),
            );
          }),
    );
  }
}