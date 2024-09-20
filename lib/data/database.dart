import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List todoList = [];
  final _myBox = Hive.box('todo_box');

  void loadData(){
    todoList = _myBox.get('todoList')??[];
  }

  void updateDataBase(){
    _myBox.put('todoList', todoList);
  }
}