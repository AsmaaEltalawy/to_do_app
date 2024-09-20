import 'package:flutter/material.dart';

class ToDoRaw extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;

   final Function(bool?)? onchanged;

  ToDoRaw(
      {required this.taskName,required this.onchanged, required this.taskCompleted});

  @override
  State<ToDoRaw> createState() => _ToDoRawState();
}

class _ToDoRawState extends State<ToDoRaw> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.pink[100], borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Checkbox(
                value: widget.taskCompleted,
                onChanged: widget.onchanged,
                activeColor: Colors.pink,
              ),
              Text(
                widget.taskName,
                style: TextStyle(
                    color: Colors.pink,
                    decoration: widget.taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//decoration: taskCompleted? TextDecoration.lineThrough
